class Constants {
  static String getSuggestions(String diagnosedLabel) {
    switch (diagnosedLabel) {
      case 'Pepper__bell___Bacterial_spot':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Avoid overhead watering to keep foliage dry. \n3. Apply copper-based fungicides as recommended for bacterial spot. \n4. Practice crop rotation and avoid planting peppers in the same soil year after year. \n5. Ensure proper spacing of plants to improve air circulation and reduce humidity.';
      case 'Pepper__bell___healthy':
        return '1. Maintain regular monitoring of your pepper plants to catch any early signs of disease. \n2. Ensure your peppers receive adequate water and nutrients for optimal growth. \n3. Continue practicing good crop rotation and field hygiene. \n4. Use organic or synthetic mulch to retain moisture and suppress weeds. \n5. Consider regular soil testing to keep track of soil health and nutrient levels.';
      case 'Potato___Early_blight':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Apply appropriate fungicides as recommended for early blight. \n3. Practice crop rotation and avoid planting potatoes in the same soil year after year. \n4. Ensure proper spacing of plants to improve air circulation and reduce humidity. \n5. Water plants at the base to avoid wetting the foliage.';
      case 'Potato___Late_blight':
        return '1. Immediately remove and dispose of infected plants to prevent spreading. \n2. Use fungicides specifically designed to combat late blight. \n3. Ensure proper drainage in the field to prevent waterlogged conditions. \n4. Avoid overhead irrigation to keep foliage dry. \n5. Plant resistant potato varieties if available.';
      case 'Potato___healthy':
        return '1. Maintain regular monitoring of your potato plants to catch any early signs of disease. \n2. Ensure your potatoes receive adequate water and nutrients for optimal growth. \n3. Continue practicing good crop rotation and field hygiene. \n4. Use organic or synthetic mulch to retain moisture and suppress weeds. \n5. Consider regular soil testing to keep track of soil health and nutrient levels.';
      case 'Tomato_Bacterial_spot':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Avoid overhead watering to keep foliage dry. \n3. Apply copper-based fungicides as recommended for bacterial spot. \n4. Practice crop rotation and avoid planting tomatoes in the same soil year after year. \n5. Ensure proper spacing of plants to improve air circulation and reduce humidity.';
      case 'Tomato_Early_blight':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Apply appropriate fungicides as recommended for early blight. \n3. Practice crop rotation and avoid planting tomatoes in the same soil year after year. \n4. Ensure proper spacing of plants to improve air circulation and reduce humidity. \n5. Water plants at the base to avoid wetting the foliage.';
      case 'Tomato_Late_blight':
        return '1. Immediately remove and dispose of infected plants to prevent spreading. \n2. Use fungicides specifically designed to combat late blight. \n3. Ensure proper drainage in the field to prevent waterlogged conditions. \n4. Avoid overhead irrigation to keep foliage dry. \n5. Plant resistant tomato varieties if available.';
      case 'Tomato_Leaf_Mold':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Apply fungicides specifically designed for leaf mold. \n3. Ensure proper spacing of plants to improve air circulation and reduce humidity. \n4. Avoid overhead watering to keep foliage dry. \n5. Increase ventilation in greenhouses if growing tomatoes indoors.';
      case 'Tomato_Septoria_leaf_spot':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Apply appropriate fungicides as recommended for Septoria leaf spot. \n3. Practice crop rotation and avoid planting tomatoes in the same soil year after year. \n4. Ensure proper spacing of plants to improve air circulation and reduce humidity. \n5. Water plants at the base to avoid wetting the foliage.';
      case 'Tomato_Spider_mites_Two_spotted_spider_mite':
        return '1. Introduce natural predators like ladybugs or predatory mites to control spider mites. \n2. Spray plants with a strong jet of water to dislodge mites from the foliage. \n3. Apply insecticidal soap or horticultural oil as recommended for spider mite control. \n4. Ensure plants are well-watered and not stressed, as stressed plants are more susceptible to mite infestations. \n5. Keep the growing area clean and free of debris where mites can hide.';
      case 'Tomato__Target_Spot':
        return '1. Remove and destroy infected leaves to prevent the spread of the disease. \n2. Apply appropriate fungicides as recommended for target spot. \n3. Practice crop rotation and avoid planting tomatoes in the same soil year after year. \n4. Ensure proper spacing of plants to improve air circulation and reduce humidity. \n5. Water plants at the base to avoid wetting the foliage.';
      case 'Tomato__Tomato_YellowLeaf__Curl_Virus':
        return '1. Remove and destroy infected plants to prevent the spread of the virus. \n2. Control whitefly populations, as they are the primary vectors of the virus. \n3. Use reflective mulches to repel whiteflies and reduce their numbers. \n4. Plant resistant tomato varieties if available. \n5. Ensure proper plant nutrition and water management to help plants resist infection.';
      case 'Tomato__Tomato_mosaic_virus':
        return '1. Remove and destroy infected plants to prevent the spread of the virus. \n2. Disinfect gardening tools and hands after handling infected plants. \n3. Avoid tobacco products around tomato plants, as the virus can be transmitted from tobacco. \n4. Plant resistant tomato varieties if available. \n5. Ensure proper plant nutrition and water management to help plants resist infection.';
      case 'Tomato_healthy':
        return '1. Maintain regular monitoring of your tomato plants to catch any early signs of disease. \n2. Ensure your tomatoes receive adequate water and nutrients for optimal growth. \n3. Continue practicing good crop rotation and field hygiene. \n4. Use organic or synthetic mulch to retain moisture and suppress weeds. \n5. Consider regular soil testing to keep track of soil health and nutrient levels.';
      default:
        return '';
    }
  }
}
