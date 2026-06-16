Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41069CD98DA
	for <linux-i3c@archiver.kernel.org>; Tue, 16 Jun 2026 07:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:From:
	References:To:Subject:Date:Message-ID:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=zdNS7EvOOLpI08zqSOcEOaGlHMH/k4vOzO/LQKsPvKw=; b=QugtOJXnVn81ZDMfYEeVkSLF7o
	6vEjeKwPjJImDXkq0WsvQ4AVDcKN7E/XMYuZsRk5OdSX9sbfH6AKM2XNY11oFF/Y+QQERIObLD4nr
	VJY/xzBPWyCZZuf+GgRHIPBtfLud+j2eD8DFMnfuI99VO+fM4ZIv5Bi/25k9Y8KI3xAqCQFIV7mOs
	LJkaWaELm9YruXkslSF3To6LkCx7yy68sckoMuNcbnjMPpGqFLY0nTMNMryfe8X95+iNOcAc+76lo
	bbtPcqEmV1HmpRh0lLGFc4MJ76vmVK/aqyRNEU0eXH1Aal2si6dLrYoLRdYoGXUNx5dvKuWphXI/6
	qAxM03VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOQw-0000000FO8g-04aZ;
	Tue, 16 Jun 2026 07:42:06 +0000
Received: from mgamail.intel.com ([192.198.163.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZOQt-0000000FO8D-2kfE
	for linux-i3c@lists.infradead.org;
	Tue, 16 Jun 2026 07:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781595724; x=1813131724;
  h=message-id:date:subject:to:references:from:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=1PT+wpB5I0pWlb/iemqsx7Knm9skMgbJFJ/rn8pqvQc=;
  b=oAsd2OxUggcwTl+Md3bUho9SNiZn6lGfs67G9R5woL869lAVJGpaqHY4
   jBPez7kWapK1auS6+8hgHSwPAP4/B6vzGFPx/4+5jSU88RTXmyIBCpVFh
   UftxIpjT3pW/XbQhjZy1k5vhZkqElYkzkXrE5Th2mYI3cJIj7NLu9lhp5
   tLnRCp7yxdz/vbX2j5tyESxUbri5bEyUcTa7yHAD6Kd+YyBV+CfqfzfFd
   CiabPfHjcVu8EljVCs+cx+DCWOOSpTkrcTcvLL5vkJwjdmCZmeU8PTXLL
   /oqYFJpac0Tc/0iBLOmcT7k+679AfXrTPjGoLXmjd2rzsVO5RKnfxRmV5
   w==;
X-CSE-ConnectionGUID: VrWla0bpQZam5xGA/AsiAw==
X-CSE-MsgGUID: CsYq5d+gTOmSI9wYkDiGLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11818"; a="84916269"
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="84916269"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:41:44 -0700
X-CSE-ConnectionGUID: 8q7YuwFoS6Sd8YdH7o6lrA==
X-CSE-MsgGUID: Gwthanr1Q4ab6nxzMv7UOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,207,1774335600"; 
   d="scan'208";a="285809877"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 00:41:42 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 00:41:41 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 00:41:41 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 00:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NLe/3jcf5gkHaiZrV7sME3siy8aI4RPAwu4yVpAuAwYLro7C9iZTSiljRPW0gI3Kgwm3nwm4ju8ULLp78Dewj4yPWpTk7Di3ivvkj78imfPiF2qExGQO555n5tpVmQGsGpAuEWZ7EGLr7Dh78zddb8PQyS2w/qjn8pUl6gpFXlUHwu+rMBKECwmbeMMWrGT2SSkUXPsjVQNo2nDBbe+Vspp7zpJ17kSOIbcRSHv+hcuDrQOdkr19xhg5f8ZIY9ZoF+niTUxXCB/edyndNCE1VM2K1oBZbNFGVn9aFo4vdBWiogPVNgnQRyaIhTow0fmMALkjS3RESXbjuDYzAPqLuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/st1ozt75CsT1/zZjDXDKRhlafiYAEyCtFXPvNyoIKY=;
 b=DmFlI4TWRBY8EiFKC0ix0T8L6wA4j25Rrs+eyOc7J3YjDWnd6VM6n8RzerxwNL+039FO/3Efy5sfEX+DfGED+9Fo9hm4iYxlDUvAa6OHPh7j8zPtpdOekw+lmDz00DnA4Rswd7mxmOvbnQXskpdWNWFHy7bDHMkHla8yBZnLi/0Ce8vcXYLneE7Jh1/cHzRBofcKAB7SLFzlKii7OHmrtTT6pSPcjPSaWwgn7vRqWpOpKDH/ZfaSzDGqcgnEAdL4ZbjUS24S5hPce6xNbj9M6I0onN0bRB5+Ejs94XizzKeONU/y9xElUOSuGL4RmM6KYmwExLwvnuDioEpVbADJRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7198.namprd11.prod.outlook.com (2603:10b6:208:419::15)
 by IA3PR11MB9207.namprd11.prod.outlook.com (2603:10b6:208:578::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 07:41:34 +0000
Received: from IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456]) by IA1PR11MB7198.namprd11.prod.outlook.com
 ([fe80::2c4e:e92a:4fa:a456%3]) with mapi id 15.21.0113.015; Tue, 16 Jun 2026
 07:41:34 +0000
Message-ID: <29a3da29-d67c-4596-9a50-e42355726368@intel.com>
Date: Tue, 16 Jun 2026 10:41:28 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/3] i3c: master: Validate GET CCC payload length and
 retry M0/M2 once
To: <tze.yee.ng@altera.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, "Adrian Ng Ho
 Yin" <adrian.ho.yin.ng@altera.com>, Felix Gu <ustc.gu@gmail.com>, Wolfram
 Sang <wsa+renesas@sang-engineering.com>, Manikanta Guntupalli
	<manikanta.guntupalli@amd.com>, Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>, <linux-i3c@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
References: <cover.1781142158.git.tze.yee.ng@altera.com>
 <cfe9e0f7ce49e268cd582a939206dc0b6c4e42e1.1781142158.git.tze.yee.ng@altera.com>
Content-Language: en-US
From: Adrian Hunter <adrian.hunter@intel.com>
Organization: Intel Finland Oy, Registered Address: c/o Alberga Business Park,
 6 krs, Bertel Jungin Aukio 5, 02600 Espoo, Business Identity Code: 0357606 -
 4, Domiciled in Helsinki
In-Reply-To: <cfe9e0f7ce49e268cd582a939206dc0b6c4e42e1.1781142158.git.tze.yee.ng@altera.com>
X-ClientProxiedBy: DUZPR01CA0031.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:468::16) To IA1PR11MB7198.namprd11.prod.outlook.com
 (2603:10b6:208:419::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7198:EE_|IA3PR11MB9207:EE_
X-MS-Office365-Filtering-Correlation-Id: e92c52a3-d652-4add-fbb4-08decb7ab069
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014|23010399003|18002099003|22082099003|921020|11063799006|3023799007|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info: H1IZT2M7MIj8QsEmP14DDFw7/SY/NxigP+JwGafAQqexwad2WNrUxoMnt+CFL4H7UJOCQB3UQTc5yhiMS+rOTU0btCUJdNU7RYI2k5JFxfWoVqEP+efOPpJIMBdTeWFon6/jqlXJSlw6LunfmS9mJ0hfE83sfgfBjX1kjm4NakG0yKx2OAinK7WHKPvBdHC3QEBYINfK2rmf4wwksv2Ac3j14BVtdZNU8dIiOxSiIExfPJcIip/AZE7RzvCnTdGt1csOZbuEavZVKtZJsF/od/m+4mBiWO3sCF1cP6kiUquc/JUwWYWt2n5qaoNJEyMA9ekBTBG4ZR9Et994ILOxZmgQJGbn2OYo8HLxblLsw2CMM6PNHPFitBO+QzH/ZaBSCyRaR2oM9KoeRxMaeEMc+DoNdKKOZEj+yxRqSjj058jHGtrJ1DEhDiKqYpJTrMnzP/8pQNl+W2qnHrl9R8XwGReIDR3IB/sIQrMif+kLWKT3xwieBO3RThaxniT2cIrMSjPT7QbVA8jWAiFzuv9cQHnYIiRYcvMeYO/ShvUutUlws/UTvUPBJbBk6igkoutEFk7kMc6ctQKBWEpcjm8JwbEWC6l8mRtveO9ikGrx2PLHDqyXGzn9oLQsZO3r0tM+orMa0DgTzgjVulyY3GfScmWaFOd9udETog4N1cbbsN9kMjfHSdYsxbzk9kQv+/ZOgYgrodsOarCVSiZcYJCWJ0D8tkBbwZ/Oj2ByiCgCKks=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB7198.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014)(23010399003)(18002099003)(22082099003)(921020)(11063799006)(3023799007)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c3pJMlpaa0tCazd4c0FHdmFUcEdHejdIN053alUvZXJKQUFXL0RldUN6Tnlq?=
 =?utf-8?B?UTlEanMvbGpLTUdYVWJuNExWSmluL0RGdEFUZFQwTkVMNkZ2ampYaHp2N2ZP?=
 =?utf-8?B?bXRXUmlxQ3JRdm5ob0F4WXp1Mm00OXdKaU41cDlkSmx1M0pmeXNZUTZiQVMz?=
 =?utf-8?B?bDZFUTBMN0FGYmh6MEl1bFJhb2FDemNJNXNIcFNVMHJIOUthMS9OZjRWa2Z6?=
 =?utf-8?B?YjI0SWxaUVVjaXFVM0tDSzZUa0tDM09iZWpXb09aQnhmQ2t5a2Z1cW95WG16?=
 =?utf-8?B?eVVVTmR6Yll4M0JmSHAxNy91NVo4Skx4UGV0UTJKVjU3bmhRTlN5c2loY3Bw?=
 =?utf-8?B?NEhvTGg0a08zdWltUVNaMlpwZ3VDZ0wyM2JoZmdWVzUyaE5RaEVrOG5Od2ho?=
 =?utf-8?B?MnhCLzdyaW84L1dUM05GSGZnck5xczliUGlZQWVvdkUramZoVFh0RXJjdGpY?=
 =?utf-8?B?VkNuNnRSZGRGcTFFUVZBVDRXV3FSWVBxSTVCUWEvTWJPTit5U3k4YjJGVDhY?=
 =?utf-8?B?azRuaTA5ek0vR3Z5SG0zTXptT0dTdGpFcGFFb3dvUTAxTFZ3bnNDMXVIZmQ0?=
 =?utf-8?B?ZHVGZHRCNS9Ob09BTmJEeTVTUkYra2trb3M0cDlmTUZQVkdkMklDdUc2bVhR?=
 =?utf-8?B?Y3VlQkV6MjVYMmJ0ZTFXSEw1Y1ZwWWQrclIzdCt3ZGFha3ZSSmdsWjFNZld5?=
 =?utf-8?B?TDhCdHhhbHJTRFJZbFVXODM3V1B1ZlhhY1NhWUNySHoyaHE1SURBOFVCVXRK?=
 =?utf-8?B?YmlHNlhPUUdyd3cwSFh1QXpjcGt3STVFVzI4SnVvbFZHTFAyTTQ5TDhlYzdJ?=
 =?utf-8?B?SDIxTGd6dm5LVjM2b2lmc21BQ3QyclhaQnRsRm9taStQUjdoNHdaTmlEZmlh?=
 =?utf-8?B?WUNEMkxhSDhyeTYyZ1pWTTVzRVMzTnpoZ25LMnBLSEVaOEdwcTFrRjZIYlls?=
 =?utf-8?B?RURDUFE4T0tpTlQ2a1c4czM3SmFBS2NpNjRQaUZHV2NaUDROTXE0amliNzRa?=
 =?utf-8?B?cTBjbnM1Y1FmRmR1dUhaMEgxMHhnRGxZWTJmLzJRaS9QaHBDT1V0czZwbUNy?=
 =?utf-8?B?NFJtMFNsZXlxU1Q4VVdWQVI3MEgrWDVYYjF3TzBoQWlSUW00aE5kejRyWXRm?=
 =?utf-8?B?UlVIR3lLV1pGbTJZcnFCRmpwV0JGRDZvWkdIWU5sTW0yOXA2OEZIMHpvY0Z2?=
 =?utf-8?B?N0JNamhRbFJFOGZJSDZ0UXByWkt2UVZPekFuaFErNzdySFNTS2xrWTlPNlpE?=
 =?utf-8?B?TFlZVkZOTkFLekNMd3BZMG9RQzNsQ1BSQlJacGxqbUoyaUV5eUxxcnoxZFR6?=
 =?utf-8?B?TU02ZUhZWlkvbjVPRUxHQlBVUnFISmxnT2xJSldBUnZoSE01bWtPbDNoUzE3?=
 =?utf-8?B?Ulo4UDEzYmJLam9TSmRRanJ2a1kzRUw5YmUyWFBCc1RCb1NLMmtSd1hscTlS?=
 =?utf-8?B?aUg2NlE2SUpHbmZuVERsU3BaK3dVd2t0c2d3LzgrbXJrazNHTzJrNFV1UzAy?=
 =?utf-8?B?UVNNWS9SOUFwNXBHOUVPWXk4TUZKMVlTdWhremJPM2V0dFZRVVdLekhoNC9n?=
 =?utf-8?B?dTEyNndhSXVRdVlMbm40M08yc09lTnVIak10VlBvbW11WGp2dXVHeTlpSzJ5?=
 =?utf-8?B?bXVlTWdyaXVqWkdQbC9GekVEVGMvOXJRV2pWZlh1S3lVcXNzUWprTmdkU0tT?=
 =?utf-8?B?VFRvNkFjbEhiQnYrcFFGOGYzRmxRb21reTNCVk82RmFBSlRJdysraVBLeE15?=
 =?utf-8?B?eWNGY3RhWmgxZnFOeXQwV3lwQjdxbURXMFFneWlWckJCSVZqWjAyS0I3WVJC?=
 =?utf-8?B?OGgyaEh0MmVqZnBFRkpnblhxbGNkR05sZHZ5enErOFF1bloybGZ1a0tDOWlV?=
 =?utf-8?B?V3MyMFRWV0paZjV6TElzSTVoN1oxWE9xdy9ROVF3RFQ1YlM4NjBJWjZidXBS?=
 =?utf-8?B?VnkrTkdKbEFERFBQeGE4TW5RKy8yenozb3Q1U1F2aUxkNGUvMmxWVkpnR3A5?=
 =?utf-8?B?bmNLVUtuZ2xMbjVGSmhYM0twbUYxNUhmUFUvV2FzNk9ZelBrY3E4QmJIaUZs?=
 =?utf-8?B?U2JjeC9tQzVTTjNoZjN6RmhIUWJWbTJURkJZZVhYWFFHRlVRWkRxVkF4bktV?=
 =?utf-8?B?UTRFTUZqZDJmd1dSd1Axd3lzc1BkSXdiYU8wK25PUUwvbkpROC9CYXBGZVhC?=
 =?utf-8?B?L1JNa3MzSW1hRHptUkYzMi9FNnNEY3M1c2p0QmFWTXc0a3REOU9zWStNNXZZ?=
 =?utf-8?B?cXBRYnhRbUJHbHJZRU5GMWUrcjdrTTk4WjE2WW5XeCtHVmZPNVQwVG5ycjVV?=
 =?utf-8?B?Skt4VDlBcjZYSHpVb3d5dmprUDJsOUt1N3hkL0VUNHJsKzYrYzIzZ1NPRTh6?=
 =?utf-8?Q?WH3jhQKtttNPjkZU=3D?=
X-Exchange-RoutingPolicyChecked: nKKmU4wMbCoK6e+RQhPMMrbOe5DzDgfeYdW3HC1ebdWvmq0OUlFYLPZ/6w5MmsG+5BMmrK6gVIwg7zopjDuHi1jy3BxnBGkePi9o3PXcIbFl8j4MQvYD4RAnTtzNL+YRa87lF5YZ++9Z3W0J0GlQa9tloPpO4li+eFrH6cli9qsbV/wU2F1v8B5T2A1/RCGzeBW7ogjeJ8rJhbm8EYZ9SKtTs6BIn8Jer+qgUVFgaPN46MbuJEs5b8bpgQpeQ9FvHvyYLrOtdGSwATQpdRbTcTYH3gIfu66+RPV2bBivuatzmFEXplXS7C4ijyu3IkET2M79hpzEUdgaHJGgLc45OQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: e92c52a3-d652-4add-fbb4-08decb7ab069
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7198.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 07:41:34.1652
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5LUdkiDmj7Ic3fKdeXXJFABd2LiDx5Kbu7C8yIJO3WjxwaJGC8FbfnNW0P2Tnhdf6P1XxmvXI7V66yl2KpY4nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9207
X-OriginatorOrg: intel.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_004203_756276_7F0A2CA1 
X-CRM114-Status: GOOD (  25.57  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

T24gMTEvMDYvMjAyNiAwNDo1NCwgdHplLnllZS5uZ0BhbHRlcmEuY29tIHdyb3RlOgo+IEZyb206
IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5oby55aW4ubmdAYWx0ZXJhLmNvbT4KPiAKPiBWYWxp
ZGF0ZSBHRVQgQ0NDIHBheWxvYWQgbGVuZ3RoIGFmdGVyIGEgc3VjY2Vzc2Z1bCB0cmFuc2Zlci4g
VHJlYXQgYQo+IHNob3J0IHJlYWQgYXMgSTNDX0VSUk9SX00wIGFuZCByZXR1cm4gLUVJTy4gR0VU
TVJMIGFjY2VwdHMgZXhhY3RseSAyIG9yCj4gMyBieXRlcyBwZXIgdGhlIEkzQyBzcGVjIGRlZmlu
ZWQgZm9ybWF0cy4gR0VUTVhEUyBtYXkgcmV0dXJuIDIgYnl0ZXMKPiAoZm9ybWF0IDEpIG9yIDUg
Ynl0ZXMgKGZvcm1hdCAyKSBwZXIgSTNDIHNwZWMuCj4gCj4gUmV0cnkgR0VUIENDQ3Mgb25jZSBv
biByZXRyaWFibGUgZXJyb3JzOiBJM0NfRVJST1JfTTAgKGZyYW1lIGVycm9yKSBhbmQKPiBJM0Nf
RVJST1JfTTIgKGFkZHJlc3MtaGVhZGVyIE5BQ0ssIGUuZy4gSUJJIG9yIENvbnRyb2xsZXIgUm9s
ZSBSZXF1ZXN0ClNvbWUgY29udHJvbGxlciBkcml2ZXJzIGRvIG5vdCBzZXQgSTNDX0VSUk9SX00y
IGNvcnJlY3RseToKICBzdmMtaTNjLW1hc3RlciBzZWVtcyB0byBzZXQgSTNDX0VSUk9SX00yIG9u
IGFsbCBlcnJvcnMKICBtaXBpLWkzYy1oY2kgc2V0cyBpdCBhbHNvIG9uIGVycm9yIHN0YXR1cyAw
eDU6IE5BQ0s6IEFkZHJlc3Mgd2FzIE5BQ0vigJllZAoKT3RoZXJzIG5lZWQgdG8gYmUgY2hlY2tl
ZAoKPiBhcmJpdHJhdGlvbiBwZXIgSTNDIHNwZWMgc2VjdGlvbiA1LjEuMi4yLjMpLiBTRVQgQ0ND
cyBhcmUgbm90IHJldHJpZWQKCldoYXQgaGFzIHNlY3Rpb24gNS4xLjIuMi4zIGdvdCB0byBkbyB3
aXRoIEkzQ19FUlJPUl9NMj8KCj4gdG8gYXZvaWQgcmVwZWF0aW5nIHNpZGUtZWZmZWN0aW5nIGNv
bW1hbmRzLiBSZXN0b3JlIGRlc3RzW10ucGF5bG9hZC5sZW4KPiB0byB0aGUgb3JpZ2luYWxseSBy
ZXF1ZXN0ZWQgbGVuZ3RoIGJlZm9yZSBlYWNoIGF0dGVtcHQgYW5kIGFnYWluIGJlZm9yZQo+IHJl
dHVybmluZyBhbiBlcnJvciwgc28gY2FsbGVycyB0aGF0IGFkanVzdCB0aGUgbGVuZ3RoIG9uIGZh
aWx1cmUgKGUuZy4KPiBpM2NfbWFzdGVyX2dldG14ZHNfbG9ja2VkKCkpIGRvIG5vdCB1bmRlcmZs
b3cgYSBzaG9ydGVuZWQgdmFsdWUuCj4gCj4gVXNlIGEgc3RhY2sgYnVmZmVyIGZvciB0aGUgY29t
bW9uIHNpbmdsZS1kZXN0aW5hdGlvbiBHRVQgY2FzZSBhbmQgb25seQo+IGttYWxsb2Mgd2hlbiBu
ZGVzdHMgPiAxLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFkcmlhbiBOZyBIbyBZaW4gPGFkcmlhbi5o
by55aW4ubmdAYWx0ZXJhLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBUemUgWWVlIE5nIDx0emUueWVl
Lm5nQGFsdGVyYS5jb20+Cj4gLS0tCj4gQ2hhbmdlcyBpbiB2MzoKPiAtIERyb3AgdGhlIGNoYW5n
ZSB0aGF0IG1vdmVzIFJFU1BPTlNFX0VSUk9SX0FERFJFU1NfTkFDSyB0byBkZWZhdWx0IGNhc2UK
PiAgIGluIGR3X2kzY19tYXN0ZXJfZW5kX3hmZXJfbG9ja2VkKCkuIE5vdyBkd19pM2NfbWFzdGVy
X2VuZF94ZmVyX2xvY2tlZCgpCj4gICByZXR1cm5zIC1FSU8gZm9yIFJFU1BPTlNFX0VSUk9SX0FE
RFJFU1NfTkFDSy4KPiAtLS0KPiAgZHJpdmVycy9pM2MvbWFzdGVyLmMgfCAxMTEgKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTEw
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9p
M2MvbWFzdGVyLmMgYi9kcml2ZXJzL2kzYy9tYXN0ZXIuYwo+IGluZGV4IDVjZDRlNWRhMjIzMy4u
Yzk0ZDM3Y2Q4YjNmIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvaTNjL21hc3Rlci5jCj4gKysrIGIv
ZHJpdmVycy9pM2MvbWFzdGVyLmMKPiBAQCAtMjYsNiArMjYsMTIgQEAgc3RhdGljIERFRklORV9N
VVRFWChpM2NfY29yZV9sb2NrKTsKPiAgc3RhdGljIGludCBfX2kzY19maXJzdF9keW5hbWljX2J1
c19udW07Cj4gIHN0YXRpYyBCTE9DS0lOR19OT1RJRklFUl9IRUFEKGkzY19idXNfbm90aWZpZXIp
Owo+ICAKPiArI2RlZmluZSBJM0NfQ0NDX0dFVE1STF9MRU5fU0hPUlQJMgo+ICsjZGVmaW5lIEkz
Q19DQ0NfR0VUTVJMX0xFTl9GVUxMCQkzCj4gKyNkZWZpbmUgSTNDX0NDQ19HRVRNWERTX0xFTl9T
SE9SVAkyCj4gKyNkZWZpbmUgSTNDX0NDQ19HRVRNWERTX0xFTl9GVUxMCTUKPiArI2RlZmluZSBJ
M0NfQ0NDX01BWF9SRVRSSUVTCTIKPiArCj4gIC8qKgo+ICAgKiBpM2NfYnVzX21haW50ZW5hbmNl
X2xvY2sgLSBMb2NrIHRoZSBidXMgZm9yIGEgbWFpbnRlbmFuY2Ugb3BlcmF0aW9uCj4gICAqIEBi
dXM6IEkzQyBidXMgdG8gdGFrZSB0aGUgbG9jayBvbgo+IEBAIC05MjUsNiArOTMxLDYxIEBAIHN0
YXRpYyB2b2lkIGkzY19jY2NfY21kX2luaXQoc3RydWN0IGkzY19jY2NfY21kICpjbWQsIGJvb2wg
cm53LCB1OCBpZCwKPiAgCWNtZC0+ZXJyID0gSTNDX0VSUk9SX1VOS05PV047Cj4gIH0KPiAgCj4g
K3N0YXRpYyBib29sIGkzY19jY2NfZ2V0X3BheWxvYWRfb2sodTggaWQsIHUxNiByZXFfbGVuLCB1
MTYgYWN0dWFsX2xlbikKPiArewo+ICsJaWYgKGFjdHVhbF9sZW4gPiByZXFfbGVuKQo+ICsJCXJl
dHVybiBmYWxzZTsKPiArCj4gKwlpZiAoIXJlcV9sZW4pCj4gKwkJcmV0dXJuIGFjdHVhbF9sZW4g
PT0gMDsKPiArCj4gKwlpZiAoaWQgPT0gSTNDX0NDQ19HRVRNUkwpCj4gKwkJcmV0dXJuIGFjdHVh
bF9sZW4gPT0gSTNDX0NDQ19HRVRNUkxfTEVOX1NIT1JUIHx8Cj4gKwkJICAgICAgIGFjdHVhbF9s
ZW4gPT0gSTNDX0NDQ19HRVRNUkxfTEVOX0ZVTEw7Cj4gKwo+ICsJaWYgKGlkID09IEkzQ19DQ0Nf
R0VUTVhEUykKPiArCQlyZXR1cm4gYWN0dWFsX2xlbiA9PSBJM0NfQ0NDX0dFVE1YRFNfTEVOX1NI
T1JUIHx8Cj4gKwkJICAgICAgIGFjdHVhbF9sZW4gPT0gSTNDX0NDQ19HRVRNWERTX0xFTl9GVUxM
OwoKSXQgd291bGQgYmUgYmV0dGVyIHRvIGNvbnRhaW4gaW5kaXZpZHVhbCBDQ0MgaW5mb3JtYXRp
b24gaW4KdGhlIGNhbGxlciBvZiBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQoKS4gIFBl
cmhhcHMKYWRkIG9wdGlvbmFsX2J5dGVzIHRvIHN0cnVjdCBpM2NfY2NjX2NtZF9wYXlsb2FkOgoJ
Rm9yIEkzQ19DQ0NfR0VUTVJMLCBvcHRpb25hbF9ieXRlcyA9IDEKCUZvciBJM0NfQ0NDX0dFVE1Y
RFMsIG9wdGlvbmFsX2J5dGVzID0gMwoKPiArCj4gKwlyZXR1cm4gYWN0dWFsX2xlbiA9PSByZXFf
bGVuOwo+ICt9Cj4gKwo+ICtzdGF0aWMgaW50IGkzY19jY2NfdmFsaWRhdGVfcGF5bG9hZF9sZW4o
c3RydWN0IGkzY19jY2NfY21kICpjbWQsCj4gKwkJCQkJY29uc3QgdTE2ICpyZXFfbGVucykKPiAr
ewo+ICsJdW5zaWduZWQgaW50IGk7Cj4gKwo+ICsJaWYgKCFjbWQtPnJudykKPiArCQlyZXR1cm4g
MDsKPiArCj4gKwlmb3IgKGkgPSAwOyBpIDwgY21kLT5uZGVzdHM7IGkrKykgewo+ICsJCXUxNiBh
Y3R1YWwgPSBjbWQtPmRlc3RzW2ldLnBheWxvYWQubGVuOwo+ICsJCXUxNiByZXEgPSByZXFfbGVu
c1tpXTsKPiArCj4gKwkJaWYgKCFpM2NfY2NjX2dldF9wYXlsb2FkX29rKGNtZC0+aWQsIHJlcSwg
YWN0dWFsKSkgewo+ICsJCQljbWQtPmVyciA9IEkzQ19FUlJPUl9NMDsKPiArCQkJcmV0dXJuIC1F
SU87Cj4gKwkJfQo+ICsJfQo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICsvKgo+ICsgKiBN
MDogdHJhbnNpZW50IGZyYW1lIGVycm9ycy4KPiArICogTTI6IGFkZHJlc3MtaGVhZGVyIE5BQ0sg
KEkzQyBzcGVjIHNlY3Rpb24gNS4xLjIuMi4zKSwgZS5nLiB3aGVuIGEgdGFyZ2V0Cj4gKyAqICAg
ICBzaW11bHRhbmVvdXNseSBhc3NlcnRzIGFuIElCSSBvciBDb250cm9sbGVyIFJvbGUgUmVxdWVz
dCBhbmQgbmVpdGhlcgo+ICsgKiAgICAgc2lkZSBBQ0tzLiBTb2Z0d2FyZSBzaG91bGQgcmUtaXNz
dWUgdGhlIHRyYW5zZmVyOyB0aGUgY29udHJvbGxlciB3aW5zCj4gKyAqICAgICBhcmJpdHJhdGlv
biBhZnRlciBSZXBlYXRlZCBTVEFSVC4KPiArICoKPiArICogUmV0cmllcyBhcHBseSB0byBHRVQg
Q0NDcyBvbmx5OyBTRVQgQ0NDcyBhcmUgbm90IHJldHJpZWQgdG8gYXZvaWQKPiArICogcmVwZWF0
aW5nIHNpZGUtZWZmZWN0aW5nIGNvbW1hbmRzLgo+ICsgKi8KPiArc3RhdGljIGJvb2wgaTNjX2Nj
Y19lcnJfcmV0cmlhYmxlKGVudW0gaTNjX2Vycm9yX2NvZGUgZXJyKQo+ICt7Cj4gKwlyZXR1cm4g
ZXJyID09IEkzQ19FUlJPUl9NMCB8fCBlcnIgPT0gSTNDX0VSUk9SX00yOwo+ICt9Cj4gKwo+ICAv
KioKPiAgICogaTNjX21hc3Rlcl9zZW5kX2NjY19jbWRfbG9ja2VkKCkgLSBzZW5kIGEgQ0NDIChD
b21tb24gQ29tbWFuZCBDb2RlcykKPiAgICogQG1hc3RlcjogbWFzdGVyIHVzZWQgdG8gc2VuZCBm
cmFtZXMgb24gdGhlIGJ1cwo+IEBAIC05MzYsOSArOTk3LDE3IEBAIHN0YXRpYyB2b2lkIGkzY19j
Y2NfY21kX2luaXQoc3RydWN0IGkzY19jY2NfY21kICpjbWQsIGJvb2wgcm53LCB1OCBpZCwKPiAg
c3RhdGljIGludCBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2NrZWQoc3RydWN0IGkzY19tYXN0
ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ICAJCQkJCSAgc3RydWN0IGkzY19jY2NfY21kICpjbWQp
Cj4gIHsKPiArCXUxNiByZXFfbGVuOwo+ICsJdTE2ICpyZXFfbGVucyA9IE5VTEw7Cj4gKwl1MTYg
KnJlcV9sZW5zX2FsbG9jID0gTlVMTDsKPiArCXVuc2lnbmVkIGludCBpOwo+ICsJaW50IHJldCwg
cmV0cmllczsKPiArCj4gIAlpZiAoIWNtZCB8fCAhbWFzdGVyKQo+ICAJCXJldHVybiAtRUlOVkFM
Owo+ICAKPiArCXJldHJpZXMgPSBjbWQtPnJudyA/IEkzQ19DQ0NfTUFYX1JFVFJJRVMgOiAxOwo+
ICsKPiAgCWlmIChXQVJOX09OKG1hc3Rlci0+aW5pdF9kb25lICYmCj4gIAkJICAgICFyd3NlbV9p
c19sb2NrZWQoJm1hc3Rlci0+YnVzLmxvY2spKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiBAQCAt
OTUzLDcgKzEwMjIsNDcgQEAgc3RhdGljIGludCBpM2NfbWFzdGVyX3NlbmRfY2NjX2NtZF9sb2Nr
ZWQoc3RydWN0IGkzY19tYXN0ZXJfY29udHJvbGxlciAqbWFzdGVyLAo+ICAJICAgICFtYXN0ZXIt
Pm9wcy0+c3VwcG9ydHNfY2NjX2NtZChtYXN0ZXIsIGNtZCkpCj4gIAkJcmV0dXJuIC1FT1BOT1RT
VVBQOwo+ICAKPiAtCXJldHVybiBtYXN0ZXItPm9wcy0+c2VuZF9jY2NfY21kKG1hc3RlciwgY21k
KTsKPiArCWlmIChjbWQtPnJudyAmJiBjbWQtPmRlc3RzICYmIGNtZC0+bmRlc3RzKSB7Cj4gKwkJ
aWYgKGNtZC0+bmRlc3RzID09IDEpIHsKPiArCQkJcmVxX2xlbiA9IGNtZC0+ZGVzdHNbMF0ucGF5
bG9hZC5sZW47Cj4gKwkJCXJlcV9sZW5zID0gJnJlcV9sZW47Cj4gKwkJfSBlbHNlIHsKPiArCQkJ
cmVxX2xlbnNfYWxsb2MgPSBrbWFsbG9jX2FycmF5KGNtZC0+bmRlc3RzLAo+ICsJCQkJCQkgICAg
ICAgc2l6ZW9mKCpyZXFfbGVuc19hbGxvYyksCj4gKwkJCQkJCSAgICAgICBHRlBfS0VSTkVMKTsK
ClNpbXBsZXIgdG8gYWRkIGFjdHVhbF9sZW4gdG8gc3RydWN0IGkzY19jY2NfY21kX3BheWxvYWQg
YW5kCmFtZW5kIGNvbnRyb2xsZXIgZHJpdmVycyB0byB1c2UgdGhhdC4KCj4gKwkJCWlmICghcmVx
X2xlbnNfYWxsb2MpCj4gKwkJCQlyZXR1cm4gLUVOT01FTTsKPiArCj4gKwkJCXJlcV9sZW5zID0g
cmVxX2xlbnNfYWxsb2M7Cj4gKwkJCWZvciAoaSA9IDA7IGkgPCBjbWQtPm5kZXN0czsgaSsrKQo+
ICsJCQkJcmVxX2xlbnNbaV0gPSBjbWQtPmRlc3RzW2ldLnBheWxvYWQubGVuOwo+ICsJCX0KPiAr
CX0KPiArCj4gKwlkbyB7Cj4gKwkJY21kLT5lcnIgPSBJM0NfRVJST1JfVU5LTk9XTjsKPiArCQlp
ZiAocmVxX2xlbnMpIHsKPiArCQkJZm9yIChpID0gMDsgaSA8IGNtZC0+bmRlc3RzOyBpKyspCj4g
KwkJCQljbWQtPmRlc3RzW2ldLnBheWxvYWQubGVuID0gcmVxX2xlbnNbaV07Cj4gKwkJfQo+ICsJ
CXJldCA9IG1hc3Rlci0+b3BzLT5zZW5kX2NjY19jbWQobWFzdGVyLCBjbWQpOwo+ICsJCWlmICgh
cmV0ICYmIHJlcV9sZW5zKQo+ICsJCQlyZXQgPSBpM2NfY2NjX3ZhbGlkYXRlX3BheWxvYWRfbGVu
KGNtZCwgcmVxX2xlbnMpOwo+ICsJfSB3aGlsZSAoLS1yZXRyaWVzICYmIHJldCAmJiBpM2NfY2Nj
X2Vycl9yZXRyaWFibGUoY21kLT5lcnIpKTsKPiArCj4gKwlpZiAocmV0ICYmIHJlcV9sZW5zKSB7
Cj4gKwkJLyoKPiArCQkgKiBEcml2ZXJzIG1heSB1cGRhdGUgcGF5bG9hZC5sZW4gdG8gdGhlIGFj
dHVhbCBSWCBjb3VudDsKPiArCQkgKiByZXN0b3JlIHRoZSByZXF1ZXN0ZWQgbGVuZ3RoIHNvIGNh
bGxlcnMgY2FuIHNhZmVseSBhZGp1c3QKPiArCQkgKiBpdCBvbiBlcnJvciAoZS5nLiBpM2NfbWFz
dGVyX2dldG14ZHNfbG9ja2VkKCkpLgo+ICsJCSAqLwo+ICsJCWZvciAoaSA9IDA7IGkgPCBjbWQt
Pm5kZXN0czsgaSsrKQo+ICsJCQljbWQtPmRlc3RzW2ldLnBheWxvYWQubGVuID0gcmVxX2xlbnNb
aV07Cj4gKwl9Cj4gKwo+ICsJa2ZyZWUocmVxX2xlbnNfYWxsb2MpOwo+ICsKPiArCXJldHVybiBy
ZXQ7Cj4gIH0KPiAgCj4gIHN0YXRpYyBzdHJ1Y3QgaTJjX2Rldl9kZXNjICoKCgotLSAKbGludXgt
aTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkzYwo=
