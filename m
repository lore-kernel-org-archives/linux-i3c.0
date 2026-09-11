Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B16D7C88E4C
	for <linux-i3c@archiver.kernel.org>; Fri, 11 Sep 2026 09:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shgdRoQaDJRFdQjyO4UjT92XKj+748aC5iFiYCtPqag=; b=tU4Xfphhink+bT
	bZtq7mIJfGmuG5ppxP3ciLEdOP7YrC8V0XXJMTxT1/K/pWVcUNFWS2NnR01rhj527gobul+407rBn
	E3FyuaWCzta87YMNE8N0/8e6ei8dI2IIUCYn/+3fRe5ztte2oIqGGhHEyGRlrlkgp2ButyZeSpTgY
	3yNPIcMNQ23IswnrQcVUpxsMWm6cH6xcMoWMU5GtV/iIcX/MUp2pzZ9G+ooUAETiIlYSClnWHGexV
	GRNCPLIR6rqkX8DjCBEr1MZo8O0WG6DnjThP8ySPZZlUp+6hLpKeQHKTAnjRmz6ta5pRDxZpi71+q
	FJT3XVO18JbZqhDQnzLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xT6-0000000GGAo-1kJq;
	Fri, 11 Sep 2026 09:22:48 +0000
Received: from mail-northeuropeazlp170110003.outbound.protection.outlook.com ([2a01:111:f403:c200::3] helo=DU2PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4xT2-0000000GG9R-3sHW
	for linux-i3c@lists.infradead.org;
	Fri, 11 Sep 2026 09:22:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSw10wFflIOPLXXcaV0y0MjbRmAtN0Q8SUvUswGuenpwK9g24h6sFpVN5nRAGd3f8KOR5pUmstKs9KCCU4x/xb78Ufj7egEvbCWOoX724F7T2khjfBxAHFgDCR5YP+4UTtehFmDlFhKPUysSofV59G5dVZbanHbLEb5TeKCZKeQ409dpI7Hb5ABCALE6QKCcHuUvtEmE4LyydewTS7khz78cJD/CyNsezpLAlnb7AKGs2D4LnMuyf3SSXbvBOZCsV3wD35h52JgawH8vcpSDRNeTrbUkITnib8DpYHyYPGuNnBnyef3pg0e1y+OiM2chFXr0mSzQipUL6BwD8uQUMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KIAiydCb+hVoPTeiBDx/Vc6oJqgaKY6HJ1ck3GwS3Zg=;
 b=VK1guv+/cJ/zj1SZYWYP97n8dKI4evRN6U8G9TsL5AmOyPGy0WXAO6zBbxQCUAQoGeLEKZ48wNVNSWCMAykpdcuMa7E+maiLHY/NISSUS3x6JPwDLVKE0jzF+uUE/Uh+0rvd1X7ba5rf9JxIy/ioNHbGTJCIS1x7Zce8Op0t7qW7pRzhk47Ulchm574qKUjuZrJpCGhKrbFxBNMt3TfRraVTQlB+hvi5nIpF+Dt91D9Q/nFswW2evmiWdhSnLAl+O/AUvgsuu68AGYSUIAOOwLh9a3kZ8t8QGojOWLkf/rjLUCu733V3SuTZbVQEYkYUCtxT/JH3hjLl0ynbnbMprA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIAiydCb+hVoPTeiBDx/Vc6oJqgaKY6HJ1ck3GwS3Zg=;
 b=Y/z5z6XMDYN9FnWLFWrwX72n4of+pFLDo7KeAp9NVqDlGMaNCwZZsDZM15c8JvyXrLTQ+J92iNdb+FfqD3NLVMSCcgk+TJ/A0+qWjL8I24GSSSavQmOrsx0VtbYffLL4zHPZDUCn0iLT2lAg4n423MfFzSEApBdoJsDn1zkb3ps9yA9iyiD9ltfRxJy5SgALRhK7KZMbxMtCWlNBSAT9K1lsyp9kMLvGXbS9FxQg2txBnoc8XXSPn0nJyo3sCv9wAWWuU6RrhfWlDwTmI9SQHMs5isVD/j5nuwFUyixmpkVpNMpzOn0aNXdpCShjO+dPD8RhnyOE9+CuLToY//EJPQ==
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com (2603:10a6:20b:4e7::9)
 by DB8PR04MB7146.eurprd04.prod.outlook.com (2603:10a6:10:127::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 09:22:35 +0000
Received: from AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0]) by AS4PR04MB9362.eurprd04.prod.outlook.com
 ([fe80::abe7:4a6e:a51:baf0%6]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 09:22:35 +0000
From: Lakshay Piplani <lakshay.piplani@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org"
	<conor+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>, Frank Li <frank.li@nxp.com>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>
CC: Vikash Bansal <vikash.bansal@nxp.com>, Priyanka Jain
	<priyanka.jain@nxp.com>, Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Topic: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Thread-Index: AQHdO2x0AO2+wF04XEe0sNATnkYckrbFzByAgAAQBwCAAALZAIAAFO0QgAMyH8A=
Date: Fri, 11 Sep 2026 09:22:35 +0000
Message-ID: <AS4PR04MB936261B25BA49E704DF2BD14FBBE2@AS4PR04MB9362.eurprd04.prod.outlook.com>
References: <20260903062108.2712296-1-lakshay.piplani@nxp.com>
 <20260903062108.2712296-4-lakshay.piplani@nxp.com>
 <f33ff763-136e-4c10-bd77-d40bb4baf02c@kernel.org>
 <AS4PR04MB9362BEAE2ADA8087F00DADFEFBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
 <624665dc-8f5a-4818-8786-c1c2356e58e4@kernel.org>
 <AS4PR04MB93623E44246D2F29684491D6FBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
In-Reply-To: <AS4PR04MB93623E44246D2F29684491D6FBB02@AS4PR04MB9362.eurprd04.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Enabled=True;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SiteId=686ea1d3-bc2b-4c6f-a92c-d99c5c301635;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_SetDate=2026-09-09T08:29:55.0000000Z;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Name=NXP
 Public;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_ContentBits=3;MSIP_Label_f6375508-4f8d-4bf0-98ed-14865d40f2d8_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS4PR04MB9362:EE_|DB8PR04MB7146:EE_
x-ms-office365-filtering-correlation-id: a07dd7d5-c1fd-4dc0-98a6-08df0fe63770
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|19092799006|376014|7416014|23010399003|366016|11063799006|4143699003|38070700021|56012099006|10067099003|22082099003|18002099003|921020;
x-microsoft-antispam-message-info: sCOnoUzdK1s7gFe5QEz/HiYo//K0baSXIUcc/E/8zgJTckAlJE2nTM9LwfpJI5djjWl505S+ALCa4BFP+hpKYepx7bfZcdmwqU2pKQNg6BANkxFzXFZki3bQLZs6mAGl9iiXlgL69+IKkM0xqKO7HsMltAJbPbOcXuYSWKxb+FxK70sCGarqeYltg/cpgzBnEp6NV3LTLM/+hAysLntQ6Nd0YsdaW4kgibuTa6mAG/1rS9zpRw5/HS7+BB8yboUSuIh7SyvAh3WPLvfl+wum8RbqB6sH3X5JQJlbdBF9q9fs8JuSb2b9FUnyAbBtKrMPzkYC8P2hG6yNz2woyvX+wGD5QZOnv4OAYI/gxnLZgt5kGrjgJ2kOcUfc4zN0z/YWNwbIiR6S3DRcID4b0aRyDQyYNrK4Phz7T5EjZZBIU2UyVB9hpf1DFIZaimsZ0ahnVM5UUedc+jMK+kLLOYpJPASVkrfQdXo6ssSQQ1aKSYjfLGummOyxKdC1T7q+jraN49X8c4y4W1M+s3KyQVhmPjSnQRpgAXnB+EJiHbtbS4IzodRHddBQeBnSpCdVkn5gYWQeeH6glTQvEiOmAz4OA0RE6y5zHFp4+isXSWkLUXYo8Y6JMvDowHgd+uzVplCm6xAQPyYE0Ov/STdeGr7V00OClBrKyPMxl3ZGb4y/DxQ+PNI4h+wJj1odFngWQEUHprxwTxOyc1i7Zr//b4ebLGBkC+y/MVDGC6jCzNNHxX4MbfLVT9heyBNJyBgtW3r+
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9362.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(376014)(7416014)(23010399003)(366016)(11063799006)(4143699003)(38070700021)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXVGRXV6bkxJNVBWMVBHTEp0OXlMajB4cW9CRW9kUm93eTQwVzhHMUlva3U1?=
 =?utf-8?B?WDNHUnM3aGhoQ3lnaXgrbUE1SUlEL1lUOUwyd0xCRWJkZUJ5UlRSZkFEMHYv?=
 =?utf-8?B?VnJiRTYzM0VGQ2ZJS3N0d1RQYW1JeEUrWmFCdjFsWlNqa3d5eGo2YzFOUUNR?=
 =?utf-8?B?ZlVkUTVuWVkrQ3NJUEZXM1hjUGh1YUJEb01Oays1Y0EwaVk5UTB0bWtnU3hO?=
 =?utf-8?B?ZzlGT1BkdGZuUW9BVUlXdHdVUHB6eUhRSzZDNmdNYS9ML1BGL2hBS1dVK2lQ?=
 =?utf-8?B?aDNrUFE1SnJkbDlwT3ZmMWZhWmlyVThNRWJpRnZYTjl0bXhFa0lyYk1IekFj?=
 =?utf-8?B?VXVLSnIrMndUN2dNTmlncDIwanp5YlhkcUhqWXBpVmNaVWxTamtGbnQ5eEZU?=
 =?utf-8?B?U3l4SlVqSzlOLzlON05GYXZlQ0lwcnBFZE5oWGtuZUloWHpNMjRyMzJxZkVu?=
 =?utf-8?B?OCtZQUZhRFVIcnVTUEw2amtvUldRVy9xbzNPUmhtQllaajQ5eHNVSEVqZDBh?=
 =?utf-8?B?U1htMDI0cXhwSUJRME1vN09YZE50QXF6d3B1S0FoUmlWUDIrQWZxZEU0ZTVq?=
 =?utf-8?B?SmM2T2lGOUsxNXpnTlVkdVRjMTJhRTM1ekhIZHhoaFZRYlNzQVNJQWYvSFVp?=
 =?utf-8?B?Y0g3bXBPWWdrRk9sRzUyckdFM2Z5QVd6U21SSWtHc29GSiswVCt3aUwxNTQ4?=
 =?utf-8?B?TWxYa3Q1ZGliV0liY1ZJQUY0aVdTNG0xY1hhUldrbXUzeXZLaktLalZZcHhJ?=
 =?utf-8?B?bm1wUFgxR0FWQ0lRQ0xpZzZYSjhpYTdHdmkzMUN2VWZFQ3lTTzVzUHhEeXo0?=
 =?utf-8?B?d2JvN2NiSHBNNHZiT2tJd1hrUjI2ekJFMFRLWTBMU2FTenZEekFtWlBMUHFt?=
 =?utf-8?B?ZFg1MVE2bkRZOG5ZOFVDeWtjZlBubWVxd1J6UXFidnE4VFE5bG5veDZXdnpn?=
 =?utf-8?B?R1pxNEh2WVBSd2hjQXdLRVo4SlFjMWg2QllVMzJENjdLNnRZZXMyRUdRbTBS?=
 =?utf-8?B?TkRieGRjUHZGSzBSODdiKzAveTkwTFhOR25Sem5TbWNyRkp5ZldrWTZGR1kx?=
 =?utf-8?B?TkgrV0o0ZlBiN1R1T1NPQWhxYmVrbmZxQzdSQzhITnVGT1NIQ29SLzErT0U3?=
 =?utf-8?B?Z0hRV0p6amNkWTFhdm1qVWpNVXZiZDB6dnNQTDhhcXp6TDZIZmdheGVxejlw?=
 =?utf-8?B?cVp3b0lnc3dZYTl0ZmJwYmFWU1RoMldsZXdKNyt0TE1tL3d1RmN1M01XU3Ir?=
 =?utf-8?B?TjZuejFNSFZtV3NsUStuZ0ZkVUYrZW1TSFVxN0h6K2dUeklsSWZVNlRCZlhL?=
 =?utf-8?B?MzFEaEp3R0pxa21wRHVJZ2pCd0lYL05jc0pNWXA1YmRiM3g2RTgwNkJ3ZExE?=
 =?utf-8?B?cTdGT1BTcHRjaHRIcitWczArSjg4Q2R4SkNPUkJleGNONDk0bVc1Q21uWlVt?=
 =?utf-8?B?S3haUzlBbU1ySGhFLzN3b2xjckZHanJFdHlaY0tJamV1VmcxMFI2REFSUmFw?=
 =?utf-8?B?V0ZGTE91MWRXV2xFZi92cG9nR09VVEZuTHQ0RzNxdXBPQktyb0RvL1NDNFls?=
 =?utf-8?B?UXFGamhWdjVCNy9uRlhyL21wTEZOU04waWxxejZCekNMbCtWYkpadEVpZ0V5?=
 =?utf-8?B?aDNXVXlOSUx3eG9iaTNvSUFuRFREeUYxRTRoZ1U4TmhRdWIzRXk4RHFob2JB?=
 =?utf-8?B?RzREM3pvbUVIMWtFQy9tWGZCbm5VVXFyUUpiakE3VWVtVHNCajhhaEV3cGJn?=
 =?utf-8?B?QTFwWGIwcVE4dVdwVnIyaUQ1cjRDNHF5ejcyekJ1Q2NmczV6REpvY2xsN2Nm?=
 =?utf-8?B?MUljbjBlSnQ0NlRZRklvdDdJSmVzUXloZDh4SXo1ZXUvbDB3SndMb2lReTJw?=
 =?utf-8?B?ZCtsUks5RlBVdmxDRzhYVS9QRnNhYklvcG1iZ1BoN1NGSm4zeWh3UXRRem5Z?=
 =?utf-8?B?RlBPRnhJL3Z2dFVPMERQY29Pb29IUGVkS2ptYXVUdWtTaXZEOEhOczN2dy9k?=
 =?utf-8?B?SEYzckR4WG9OTE1pRUo2TFdaM3pmUWV6RjBScjdUSnZTSTVCUVlIY29Ta0Jv?=
 =?utf-8?B?d1hDUkYzZjZGMU5xbTBvc2Fyc1V1b2Q5NTc3WHVXdWlhY05Ua2J4L29NTHp5?=
 =?utf-8?B?RUZiYzdUTFJIMGY1TzFCSzFlOTVKczkzWWFSaW5CelczaDN5Y2IrVXd2YlRu?=
 =?utf-8?B?UjJUNEtocnUvTzFiZEZEQ0tRWG8vTW42Uy9VR2l3QmtjNUZzeEtzZnNxaDlQ?=
 =?utf-8?B?S1IyT0tlOFgyY1NNeC80cVloTkQvNUdQalEweUJ5Wk1YaVV3NjVKK3BGanVy?=
 =?utf-8?B?VDN1dXM0NTZ4VWMzQlYxeVRsMUQ3ZjBJWk8zU0tMYTZDYU91SnREUT09?=
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9362.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a07dd7d5-c1fd-4dc0-98a6-08df0fe63770
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Sep 2026 09:22:35.6760
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ndWZXjMFJ1otda8pA/lSQ7faGg8chP1QVs58WPrws4f4AurjzMEPQIVBypOFFMDVZCpdmr5NvbHLGyPlpovEkA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR04MB7146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_022244_986228_2A237B6A 
X-CRM114-Status: GOOD (  19.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Krzysztof,

A gentle follow-up on my previous reply. Could you please confirm whether
my understanding is correct before I prepare the next revision.

Regards,
Lakshay


NXP Public
> -----Original Message-----
> From: Lakshay Piplani
> Sent: Wednesday, September 9, 2026 2:03 PM
> To: 'Krzysztof Kozlowski' <krzk@kernel.org>; linux-kernel@vger.kernel.org;
> linux-i3c@lists.infradead.org; alexandre.belloni@bootlin.com;
> krzk+dt@kernel.org; robh@kernel.org; conor+dt@kernel.org;
> devicetree@vger.kernel.org; broonie@kernel.org; lee@kernel.org; Frank Li
> <frank.li@nxp.com>; lgirdwood@gmail.com
> Cc: Vikash Bansal <vikash.bansal@nxp.com>; Priyanka Jain
> <priyanka.jain@nxp.com>; Aman Kumar Pandey
> <aman.kumarpandey@nxp.com>
> Subject: RE: [EXT] Re: [PATCH v18 3/8] dt-bindings: i3c: Add NXP P3H2x4x i3c-
> hub support
>
> > >>> +
> > >>> +properties:
> > >>> +  compatible:
> > >>> +    enum:
> > >>> +      - nxp,p3h2440
> > >>> +      - nxp,p3h2441
> > >>> +      - nxp,p3h2840
> > >>> +      - nxp,p3h2841
> > >>
> > >> I don't see improvements.
> > >>
> > >
> > > For this one, could you let me know in a little bit more detail what
> > > you have
> > in mind?
> >
> > I questioned if devices are compatible. It seems the answer was that
> > yes. See writing bindings doc. There is plenty of examples showing how
> > to express compatibility, if they are compatible.
> >
>
> Thanks, understood.
>
> The variants share the same programming interface, so I'll express this through
> fallback compatibles with nxp,p3h2840 as the base compatible, e.g.
> compatible = "nxp,p3h2441", "nxp,p3h2840";
>
> This follows the fallback-compatible pattern used in other upstream bindings.
>
> Is this fine?
>
> properties:
>   compatible:
>     oneOf:
>       - const: nxp,p3h2840
>       - items:
>           - enum:
>               - nxp,p3h2440
>               - nxp,p3h2441
>               - nxp,p3h2841
>           - const: nxp,p3h2840
>
> Regards
> Lakshay

A gentle follow-up on my previous reply. Could you please confirm whether my understanding is correct before I prepare the next revision?

Regards,
Lakshay
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
