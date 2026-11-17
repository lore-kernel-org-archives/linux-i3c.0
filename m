Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D4D606A32C
	for <linux-i3c@archiver.kernel.org>; Tue, 17 Nov 2026 17:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FtXltQ2B;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=WNLf4zZW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=we7WMg6aA9e4sHFYsNMzIia5uWV5XMznEvtBxZ6JPDo=; b=FtXltQ2BayZ53ev7t4RiLEbeq2
	NwOlVq4yQbEi5mngYWAGyo0lxGU4xMb3k3mVNAbjsnS5k2dyCDrtfl4EQs1MuHomhDASGfD6nGL4M
	68TXcEsq7tkYTlvZ1DN7DarRQGyDd7/fddnxHDbTjFHOxrHv9hbcvd3ekO/ebiyQLlPrcVeeUfb0k
	DLZDk0OS+dM1kjt4gAqYpWNGjlDAy2Tpr5HUSeeY32mC85XRotcGU74E8dm5UAWiA3O5Tdg7aCYGB
	SK7KzePrh8SPNixowkhnAnro4DbQL9nWOSb3kLa6LNqH5EZ28oKfLWjPGcCv4o5eXdOfXid9lvz0x
	7spS1pmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNCG-00000006dAF-408p;
	Tue, 17 Nov 2026 17:42:20 +0000
Received: from mail-westeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c201::1] helo=AM0PR83CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNC8-00000006d51-2Oxg;
	Tue, 17 Nov 2026 17:42:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q+Ir/EQ+9ntlkGcEODI7pLEZkl7JRPxv0svKoFtqGJunoRzuvY9IfjOM5B15xpFKhlIpk4QMaGwmCctDuL6la2eXqRkj/wLmFipxSDRnyT9ht38HcUAnSSlpmNjwoK1DaUdfByfAEPpRXjejFLZkIRcElJGx/NANgX11L0xX2UqdEYxw7JNmCs7PdZqdR8MS06Wf1JnIPn8LnAnIges4xPMUJp2eWs4T/JrOv1mg7uL6y9aqVTQNuNWBvUhUOVbrtGWZ5Ngn9UAN54VYb1nCyN8bV77qkb9FCN/kUrDuCiFfs8NuLHkkLRK0Lsz6UoM314S/1MSbaTeO+VJAfVRaCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YbKRE2Vsv/ZeYBynhp+udM4bS166+T+gvDCEzrzXgiE=;
 b=VztXGGeJWjtes2fPpE7lUjY+aEaLhVYWlY62N30fQQhiiwtoi7/5v6izeenzcx1ar99J16eBtgTgWSyfMbdnLXeDD41928wAYRt8E4Pi8BzbTWtmSdsj5AZa3O8XdM2iFO2zIGjFvR5MI8pMFnCdUw50//ixXIzi4rykLFnsFikns4UHtqHrfMepsSyprxqil9E4mOxlzS4KBD5Drp5msvoniZLseueeSGdRtMnfDZYTTmgjkImrnEhr58FMuv+i/sGvF6nZ5W11m4fZQhIpbMKVT0ge4emVNAcYwRTdRFJAKdaGNrJUHRk2+o++Z9fDpqQ3VxZN4vuR0zUJPBUMAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YbKRE2Vsv/ZeYBynhp+udM4bS166+T+gvDCEzrzXgiE=;
 b=WNLf4zZWo8nr+4k1r29rxRY7DkRm8nlBQo/J09VJ5Duofum2QY2zKE8t0wdQr62Px6gi8vtfbsTPkMNQ+GmCZfB7zLZywpBLNz7YJllqB2zjoXzvupns9SGGRzRADuJvUKm2mGRv1FFwxJtyU0uG7+JWvKrk94sY5vy7Z052o9PiV2kcQqIxxrN1mAGvYvNtDWg0f8oYjKuV+Vm89h9/5kUk/pf7+E/lnmA1ADvsG4wvqik6dF5E83KsiFr6UfaMCy0axYeRT8jdTftbYP58Bh0VG5uN240kHQFCPT3NKeeY1R4ErXlUrHtJNE2RxhKvzhZrqdGW/wV6zYuQLD3k6g==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by MI7PR04MB844841.eurprd04.prod.outlook.com (2603:10a6:290:10b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 17 Nov
 2026 17:42:08 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%4]) with mapi id 15.21.0615.013; Tue, 17 Nov 2026
 17:42:07 +0000
Date: Tue, 17 Nov 2026 12:41:59 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: sashiko-reviews@lists.linux.dev, linux-i3c@lists.infradead.org,
	devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
	imx@lists.linux.dev, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, neil.armstrong@linaro.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 2/2] i3c: master: svc: Add amlogic a9 support
Message-ID: <avyR51ilfZ5T6tq_@lizhi-Precision-Tower-5810>
References: <20261116-a9_i3c-v4-0-3d3222b7128d@amlogic.com>
 <20261116-a9_i3c-v4-2-3d3222b7128d@amlogic.com>
 <sashiko-outbox-216859@kernel.org>
 <avsvRS6ADfbzQkpn@SMW015318>
 <f17ef3d6-fa99-4fc8-92bc-1f588f3bf179@amlogic.com>
Content-Disposition: inline
In-Reply-To: <f17ef3d6-fa99-4fc8-92bc-1f588f3bf179@amlogic.com>
X-ClientProxiedBy: PH7P221CA0066.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::29) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|MI7PR04MB844841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b1ac2ce-dab5-4d83-d9a7-08df44d219e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|1800799024|19092799006|366016|376014|7416014|261102123227099003|261022115727099003|261022075727099003|261022113327099003|261022105027099003|261028144727099003|261021121427099003|261021130227099003|261026135527099003|261021123027099003|261021133027099003|261026121527099003|261026130827099003|261026140227099003|11063799006|4143699003|56012099006|10067099003|261021135927099003|18002099003|22082099003|6133799003|261009223027099003;
X-Microsoft-Antispam-Message-Info: E365a58zrADcmfpsm2fHVh1oBnAnWRgCl9BoobNU9C8NhJIeQdPijBqsFrLbHEf3eLXtaYOLkR2FJjWBZZR8jkZqmY5j7i3qEx43OpXVvzNGFBgYu0Co5F0xcpKJfcmJnmrO6lKkOxlcdShD9/+iuyqw6h0MMdOivKe97f3S68rpaAtu4B+DZT+t1uavQ8CGFFM8dpVKFoKps0IRb4VAImyhAncJrOEoqTbXNXtRRvRndfL7lKttiKcYbqEF/4Hie+PXqdL5mou/B0XxQafiXNBKqxiLHJOjLsEfJZ2RVgnDZde4ugLlaBrtZrtAJtl1FYj/DahsIZZC/I+1yURU7q7QyBiOUfvK9dQQgYHizdNQ41CRhoVyPaoTrzYaWhnhu+EWYYfPaHLaT9pxmtHW3mQ91edssl+3V50T6ayzqzi02pEaHU05pxW9VVipUmhAGDg7tSsbQo9zgGxqwPxZcotrlGayhNV42ECAUzEhD2nHn3LXX7XB7OQxZtm/VLx3dH4rmLJM51wYn4nYHk6f2gAwmxnnG1OVRIT0sQim7lcBXL8bs5/FeG7wR+jfU0x/UtaXU3b04BtNu7HBJuezOhB7lH7GXpuh6KBTHF/YQkM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(366016)(376014)(7416014)(261102123227099003)(261022115727099003)(261022075727099003)(261022113327099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021130227099003)(261026135527099003)(261021123027099003)(261021133027099003)(261026121527099003)(261026130827099003)(261026140227099003)(11063799006)(4143699003)(56012099006)(10067099003)(261021135927099003)(18002099003)(22082099003)(6133799003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0RoM1JRandZQUQxRUVBL0hDWllTTkhBY0JhRk9oRTZwU0M5OTR2NDVHY29Z?=
 =?utf-8?B?ZkN3SjFydlJjNTYyV2grWTFHMnk0ckZZdlZMT2gyVEhGTXRteHZWaEljcnoy?=
 =?utf-8?B?cDZ5eWNualhUMk1oNFpPSHhqK2t4UmNrSVlFV3BHaXhVcndXYUQ0bFR4VlBV?=
 =?utf-8?B?eTZxU3ExOVI0K3pDUktKNlA5ekdIV2g5RG1PdGVybllFQ1hKcVpWNDJEMzNh?=
 =?utf-8?B?Rm1NRlY2c3dnNU9YdUw1UUJBQkJvTmZwaktTalM0K3Jwc3ZPbkp3OGJNQ3RL?=
 =?utf-8?B?RHViQ0RnUVpqL3h3bEQ2b2JUbW1vYTJKK2VHZ1hhT0FWUmdSdmppRWVCWEpi?=
 =?utf-8?B?VEh3cG1JdFk1R2ptQWI5bS85TzFQcGl3MFlyenFaWUx5aTlNTHoxb2lZK2c1?=
 =?utf-8?B?VkZwVnhwa0I0U1ZSNENsZXZUcGRGUkQ4WGhBbklURGNSN2V0ampsVm9Qdk1l?=
 =?utf-8?B?Uzl2VG91a0Iwek5aRm9STTlHN3g1bDU3bVA4RUdpT1kyOXNONDFqNFJ1RTRT?=
 =?utf-8?B?ZE91dFpoNDFPSXVlN2t5WXdsVGRVMmU2aXI3N2lyRmREbVlOc1o0ZjNNc3RH?=
 =?utf-8?B?NE5XNnpHajYyZ29IUHFsRnFSYnUvUHplU3RBTXRBZ2x2OUlmWG52bzJ5dmpv?=
 =?utf-8?B?UExiWW9ST3BHUU1GTndlQjdnajkwblpONUE1WVRxY3lXdUtRUitQbE85QUJl?=
 =?utf-8?B?cmN1NXE3YnIxV2R3d0syNTdXR29QckRwSU13WksxbHFXblFiMTh1TXI2Skcw?=
 =?utf-8?B?em1Hc0FGZ1RTM09WdFN6OWluaHRjZ2NJSCs1QUNxR2lXQk5UMmVIaCt5UkxE?=
 =?utf-8?B?bWpzbHU4VVA5azg0bG1EZGdOZ1dlY1RnWFEvYW1WTG0xYlBkd1VMVlVkOTRx?=
 =?utf-8?B?bVNnaG8yREdnS2orUHA1bjRBWVVya2pWYkU4WGxrNDM2UE1iMlhyTHZlbGw5?=
 =?utf-8?B?SC9KWlFlOE50Vms1Z001QkhUeDlQQWlxOGo2SjMyaXg4dmRNNVNadXZiNXFu?=
 =?utf-8?B?NXB6QitVY2QyamoxZUwrYnBwS2FrWUxOYnp1RkhabS9RS200Skk2NXBPM0lN?=
 =?utf-8?B?VThPV0h4UDFub0FKNzZ2K1FxZWp6N05vb1JHUlp5M3dSQ1JPbmozVzVydUxH?=
 =?utf-8?B?dFRKb0xtcXY5Z2lwaXU5ck12N3MzcUxzOUd6VWhiTzNmekhvQ2llSTVlMUlI?=
 =?utf-8?B?TGNNNTZXKzlUMU4zSWZwK3FrVTNyQVE4Rms4RG5aMHRDdlZhU250aWNHZlcw?=
 =?utf-8?B?cFhVSXRoVXZDVXppN0YyZHRTdEJISis1c2RvS3JMVENxZG1oYUhwdjRCZEc0?=
 =?utf-8?B?US9YODdxNGxhVS9pWmpnTXhtVWdrdTV6VlIxa3BNZDVLSXVPT3pRWmdrNlJj?=
 =?utf-8?B?UVd6dkpyanp3d3dodTArQ2pQUXNLbHBNUFNiTFNqZEdUS3dySGhXZE1jSTMx?=
 =?utf-8?B?Qm0vRjVZeVFibTdycnF1UXF4enRaN3o0MHYvVkFpd1Q2eGV3QUJzbU5YWFVq?=
 =?utf-8?B?am00UWt4TXp2WmQyZGFoNUFNNEduSHp6cnJBMXhCSG1TSlMwUWpFd1VIVnk0?=
 =?utf-8?B?bDRlVmROVkl0akNvR3gzbHFHTGtyd1Vlb1BnalpmdEJJYWNCNEIyNWpETHFK?=
 =?utf-8?B?Mk90bW5XdUY3WmNxVFJwQkREeE11RmQ2eGpWdVZlbnh4R3lCSkxJVXRCWVF2?=
 =?utf-8?B?ZUUrL0xkRFNtUmN3dllybHlmMnRLYmtNMEY3Nk5KL3BGN2IzUUtVZWMwb3o1?=
 =?utf-8?B?UDNvSHlDalMrYXlzR05uRW9NRURJbjZzbWtnUW9mM1c4b0dyWmRuUElMQ0dZ?=
 =?utf-8?B?M2hpV1BxbGdjRlZxNzQxTVlLa1JWQmw5MzV0Q3E0N2VVOEcxNXk3QUpiTW8w?=
 =?utf-8?B?ejNvOEM1QTlCN3YyTktQSFJWZjdacE0xODI5aUlWbWdqWkNmNHdUd2FNcFM0?=
 =?utf-8?B?dkh4Y3FLeERxVUJVYWNVNDByOFlEaUV2bkJqeHR6VXNIVCt6RkptcUZtNHd2?=
 =?utf-8?B?ajdrc3NIaVFLNHJ1SmN0dkpMdDg4UU8vZXkzTmtkVzVLUHE2dmxkTVI2ZzBZ?=
 =?utf-8?B?Y0RhRTVxVnJsZWFEVTVrNnJaWVc5ZSs5dlh6aTZ0WEJuQ1hWdGUxRmpFTDJu?=
 =?utf-8?B?TWY2bC91dDBNSk5Qc29VQm5KSWhtMjBoRDJPTzdrYmRnN3dFdGx4eEhIRGIy?=
 =?utf-8?B?ZytlUW5sN0h6cGhvWXJGK3dmMHNWWEhOUE9IN2ZxSHJSTHpkL0p3K3R5K3FB?=
 =?utf-8?B?OHpYTzM3cGFzcHZ1b0NLUjFzWDZxNnkwVFo5Wm53K1lBOXlqbG5nREF3Mlky?=
 =?utf-8?B?UUl6czB4dHFXUUlCTGprSG9qMGdJcTNOYVh3TUdSVmlSK0ZISGpxeWp1blVi?=
 =?utf-8?Q?jtwpEKWGW7wvJN635nMQWo88nKbCeqNE1NNMl?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b1ac2ce-dab5-4d83-d9a7-08df44d219e9
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2026 17:42:07.9558
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /o7p5gJufrNdCgrGtoI7wsFfEjNfcmaW6m5CxDYNq2LNASaRvBK927od281ZXVBKx1jUSrxylzUVT1BDNUCKfL8HyQ/h0Q86cNgOIGfwvl51YRbiKkvVUUxNy6+SbAOL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI7PR04MB844841
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_094212_769241_1ED5CAD3 
X-CRM114-Status: GOOD (  39.45  )
X-Spam-Score: 0.0 (/)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gVHVlLCBOb3YgMTcsIDIwMjYgYXQgMDE6NDU6NDFQTSArMDgwMCwgSnVueWkgWmhhbyB3cm90
ZToKPiBIaSBmcmFua++8jAo+ICAgIHRoa3MgZm9yIHRoZSByZXZpZXcuCj4KPiBPbiAxNy8xMS8y
MDI2IDAwOjI4LCBGcmFuayBMaSB3cm90ZToKPiA+IFsgRVhURVJOQUwgRU1BSUwgXQo+ID4KPiA+
IE9uIE1vbiwgTm92IDE2LCAyMDI2IGF0IDExOjEyOjM3QU0gKzAwMDAsIHNhc2hpa28tYm90QGtl
cm5lbC5vcmcgd3JvdGU6Cj4gPiA+IFRoYW5rIHlvdSBmb3IgeW91ciBjb250cmlidXRpb24hIFNh
c2hpa28gQUkgcmV2aWV3IGZvdW5kIDMgcG90ZW50aWFsCj4gPiA+IGlzc3VlcyB0byBjb25zaWRl
cjoKPiA+ID4gLSBbTWVkaXVtXSBpM2M6IG1hc3Rlcjogc3ZjOiBOVUxMIGRlcmVmZXJlbmNlIG9m
IGNsa3NbMF0uaWQgaW4KPiA+ID4gICAgYW1sX2kzY19pbml0KCkKPiA+ID4gLSBbTWVkaXVtXSBp
M2M6IG1hc3Rlcjogc3ZjOiBjbG9ja3MgbGVmdCBlbmFibGVkIGluCj4gPiA+ICAgIHN2Y19pM2Nf
bWFzdGVyX3JlbW92ZSgpCj4gPiA+IC0gW0xvd10gaTNjOiBtYXN0ZXI6IHN2YzogZHVwbGljYXRl
IGZhc3RfY2xrIGxvb2t1cCBpbiBhbWxfaTNjX2luaXQoKQo+ID4gPiAtLQo+ID4gPgo+ID4gPiBj
b21taXQgMjYwYWViNWE0ZDVjNThkM2JlYTMyNjc0MDYyOTYwMjMxZTRkNGQyYwo+ID4gPiBBdXRo
b3I6IEp1bnlpIFpoYW8gPGp1bnlpLnpoYW9AYW1sb2dpYy5jb20+Cj4gPiA+Cj4gPiA+IGkzYzog
bWFzdGVyOiBzdmM6IEFkZCBhbWxvZ2ljIGE5IHN1cHBvcnQKPiA+ID4KPiA+ID4gVGhpcyBjb21t
aXQgYWRkcyBzdXBwb3J0IGZvciB0aGUgQW1sb2dpYyBBOSBFRS1kb21haW4gYW5kIEFPLWRvbWFp
biBTaWx2YWNvCj4gPiA+IEkzQyBjb250cm9sbGVycywgaW50cm9kdWNpbmcgYSB2ZW5kb3JfaW5p
dCBjYWxsYmFjayB0byByZWdpc3RlciB0aGUgQU8KPiA+ID4gdmFyaWFudCdzIGludGVybmFsIGNs
b2NrIGRpdmlkZXIgY2hhaW4gYW5kIGNvbmZpZ3VyZSB0aGUgZmFzdF9jbGsgcmF0ZS4KPiA+ID4K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9pM2MvbWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMg
Yi9kcml2ZXJzL2kzYy9tYXN0ZXIvc3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPiA+IGluZGV4IGU3MDAz
OTJmMDgwMWYuLjAyNjhmYzcxM2FmZGYgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9pM2Mv
bWFzdGVyL3N2Yy1pM2MtbWFzdGVyLmMKPiA+ID4gPiArKysgYi9kcml2ZXJzL2kzYy9tYXN0ZXIv
c3ZjLWkzYy1tYXN0ZXIuYwo+ID4gPgo+ID4gPiBbIC4uLiBdCj4gPiA+Cj4gPiA+ID4gQEAgLTIx
NjMsOSArMjIwOSwyMTUgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBzdmNfaTNjX2RydmRhdGEgbnBj
bTg0NV9kcnZkYXRhID0gewo+ID4gPgo+ID4gPiBbIC4uLiBdCj4gPiA+Cj4gPiA+ID4gKyAgIC8q
Cj4gPiA+ID4gKyAgICAqIEtlZXAgdGhlIGNsayBidWxrIHN0YXRlIGJhbGFuY2VkIGZvciB0aGUg
Zm9sbG93aW5nCj4gPiA+ID4gKyAgICAqIGNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKCkgY2Fs
bHMgKGVycm9yIHBhdGhzIGFuZCBydW50aW1lIFBNKS4KPiA+ID4gPiArICAgICovCj4gPiA+ID4g
KyAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShmY2xrKTsKPiA+ID4gPiArICAgaWYgKHJldCkK
PiA+ID4gPiArICAgICAgICAgICByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImNhbid0
IGVuYWJsZSBmYXN0X2Nsa1xuIik7Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICBuZXdfY2xrcyA9IGRl
dm1fa2NhbGxvYyhkZXYsIG1hc3Rlci0+bnVtX2Nsa3MgKyAxLCBzaXplb2YoKm5ld19jbGtzKSwK
PiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgR0ZQX0tFUk5FTCk7Cj4gPiA+ID4g
KyAgIGlmICghbmV3X2Nsa3MpIHsKPiA+ID4gPiArICAgICAgICAgICBjbGtfZGlzYWJsZV91bnBy
ZXBhcmUoZmNsayk7Cj4gPiA+ID4gKyAgICAgICAgICAgcmV0dXJuIC1FTk9NRU07Cj4gPiA+ID4g
KyAgIH0KPiA+ID4gPiArCj4gPiA+ID4gKyAgIG1lbWNweShuZXdfY2xrcywgbWFzdGVyLT5jbGtz
LAo+ID4gPiA+ICsgICAgICAgICAgbWFzdGVyLT5udW1fY2xrcyAqIHNpemVvZigqbWFzdGVyLT5j
bGtzKSk7Cj4gPiA+ID4gKyAgIG5ld19jbGtzW21hc3Rlci0+bnVtX2Nsa3NdLmlkID0gImZhc3Rf
Y2xrIjsKPiA+ID4gPiArICAgbmV3X2Nsa3NbbWFzdGVyLT5udW1fY2xrc10uY2xrID0gZmNsazsK
PiA+ID4gPiArICAgbWFzdGVyLT5jbGtzID0gbmV3X2Nsa3M7Cj4gPiA+ID4gKyAgIG1hc3Rlci0+
bnVtX2Nsa3MrKzsKPiA+ID4gPiArCj4gPiA+ID4gKyAgIHJldHVybiAwOwo+ID4gPiA+ICt9Cj4g
PiA+Cj4gPiA+IFtTZXZlcml0eTogTWVkaXVtXQo+ID4gPiBDYW4gdW5iaW5kaW5nIHRoZSBkcml2
ZXIgbGVhdmUgZmNsayBhbmQgdGhlIGlucHV0IGNsb2NrcyBlbmFibGVkIHdoZW4gdGhlCj4gPiA+
IGRldmljZSBpcyBub3QgcnVudGltZS1zdXNwZW5kZWQ/Cj4gPiA+Cj4gPiA+IHN2Y19pM2NfbWFz
dGVyX3JlbW92ZSgpIGNhbGxzIHBtX3J1bnRpbWVfZG9udF91c2VfYXV0b3N1c3BlbmQoKSBhbmQK
PiA+ID4gcG1fcnVudGltZV9kaXNhYmxlKCksIHJlbHlpbmcgb24gc3ZjX2kzY19ydW50aW1lX3N1
c3BlbmQoKSB0byBjYWxsCj4gPiA+IGNsa19idWxrX2Rpc2FibGVfdW5wcmVwYXJlKCkuICBJZiBD
T05GSUdfUE0gaXMgZGlzYWJsZWQsIHJ1bnRpbWUgUE0gaXMKPiA+ID4gZm9yYmlkZGVuIHZpYSBz
eXNmcywgb3IgaG90am9pbiBpcyBlbmFibGVkICh3aGljaCBob2xkcyBhIHJ1bnRpbWUgUE0KPiA+
ID4gcmVmZXJlbmNlIG5vdCByZWxlYXNlZCBieSBpM2NfbWFzdGVyX3VucmVnaXN0ZXIoKSksIHJ1
bnRpbWUgc3VzcGVuZCBkb2VzCj4gPiA+IG5vdCBydW4gZHVyaW5nIHJlbW92ZS4gIFdoZW4gZGV2
cmVzIHRoZW4gdW5yZWdpc3RlcnMgYW8tPmdhdGUuaHcsCj4gPiA+IGFvLT5kaXYuaHcsIGFuZCBh
by0+ZGl2X2VuLmh3IHdoaWxlIHRoZXkgYXJlIHN0aWxsIHByZXBhcmVkIGFuZCBlbmFibGVkLAo+
ID4gPiBjbGtfdW5yZWdpc3RlcigpIHRyaWdnZXJzIGEga2VybmVsIHdhcm5pbmcgYW5kIGxlYWtz
IHRoZSBwcmVwYXJlIGFuZAo+ID4gPiBlbmFibGUgY291bnRzIG9uIHRoZSBwYXJlbnQgcGNsay4K
PiA+Cj4gPiBTdXBwb3NlIGl0IGlzIGV4aXN0aW5nIHByb2JsZW0uCj4gPgo+IE9r77yMIG5vdCBp
bnRyb2R1Y2VkIGJ5IHRoaXMgcGF0Y2guCj4KPiBBZGRyZXNzIGl0IGluIGEgc2VwYXJhdGUgcGF0
Y2ggZm9sbG93IHRoaXMgc2VyaWVzIG9yIGNyZWF0ZSBuZXcgY2hhbmdlCj4gc2VyaWVzPwoKTmV3
IHNlcmllcy4gTWFueSBjb2RlcyBjYW4gYmUgcmVtb3ZlZCBiZWNhdXNlIGZyYW1ld29yayBhbHJl
YWR5IHN1cHBvcnQKY2FsbCBwbV9ydW50aW1lX2dldCgpIGJlZm9yZSB0cmFuZmVyIGRhdGEgYWZ0
ZXIgc2ltcGxlIHNldCBhIGZsYWcuCgpGcmFuawoKPgo+ID4gPgo+ID4gPiA+ICsKPiA+ID4gPiAr
LyoqCj4gPiA+ID4gKyAqIGFtbF9pM2NfaW5pdCAtIEFtbG9naWMgQTkgc3BlY2lmaWMgaW5pdCwg
Y2FsbGVkIHdpdGggdGhlIGNsb2NrcyBlbmFibGVkCj4gPiA+ID4gKyAqIEBtYXN0ZXI6IEkzQyBt
YXN0ZXIgY29udHJvbGxlcgo+ID4gPiA+ICsgKgo+ID4gPiA+ICsgKiBSZWdpc3RlciB0aGUgQU8g
dmFyaWFudCdzIGludGVybmFsIGRpdmlkZXIgY2hhaW4gYW5kIHJvdW5kL3NldCB0aGUgZmFzdAo+
ID4gPiA+ICsgKiBjbG9jayByYXRlIGZvciBib3RoIHZhcmlhbnRzLgo+ID4gPiA+ICsgKgo+ID4g
PiA+ICsgKiBSZXR1cm46IDAgb24gc3VjY2Vzcywgb3IgYSBuZWdhdGl2ZSBlcnJvciBjb2RlLgo+
ID4gPiA+ICsgKi8KPiA+ID4gPiArc3RhdGljIGludCBhbWxfaTNjX2luaXQoc3RydWN0IHN2Y19p
M2NfbWFzdGVyICptYXN0ZXIpCj4gPiA+ID4gK3sKPiA+ID4gPiArICAgc3RydWN0IGRldmljZSAq
ZGV2ID0gbWFzdGVyLT5kZXY7Cj4gPiA+ID4gKyAgIHN0cnVjdCBjbGsgKmZjbGs7Cj4gPiA+ID4g
KyAgIGxvbmcgZmluX2ZyZXE7Cj4gPiA+ID4gKyAgIGludCByZXQsIGk7Cj4gPiA+ID4gKwo+ID4g
PiA+ICsgICBpZiAoc3ZjX2hhc19xdWlyayhtYXN0ZXIsIEFNTF9JM0NfUVVJUktfQU8pKSB7Cj4g
PiA+ID4gKyAgICAgICAgICAgLyoKPiA+ID4gPiArICAgICAgICAgICAgKiBjbGtfYnVsa19nZXRf
YWxsKCkgcHJlc2VydmVzIHRoZSBEVCBvcmRlciwgYW5kIHRoZQo+ID4gPiA+ICsgICAgICAgICAg
ICAqIGJpbmRpbmcgcmVzdHJpY3RzIHRoZSBBTyB2YXJpYW50IHRvIGV4YWN0bHkgb25lIGNsb2Nr
LAo+ID4gPiA+ICsgICAgICAgICAgICAqIHdoaWNoIGlzIGFsd2F5cyAicGNsayIuICBTbyBjbGtz
WzBdIGlzIHRoZSBpbnB1dCBvZiB0aGUKPiA+ID4gPiArICAgICAgICAgICAgKiBpbnRlcm5hbCBk
aXZpZGVyIGNoYWluLgo+ID4gPiA+ICsgICAgICAgICAgICAqLwo+ID4gPiA+ICsgICAgICAgICAg
IGlmIChzdHJjbXAobWFzdGVyLT5jbGtzWzBdLmlkLCAicGNsayIpKQo+ID4gPiA+ICsgICAgICAg
ICAgICAgICAgICAgcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCAtRUlOVkFMLAo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgImludmFsaWQgQU8gaW5wdXQg
Y2xvY2tcbiIpOwo+ID4gPgo+ID4gPiBbU2V2ZXJpdHk6IE1lZGl1bV0KPiA+ID4gQ2FuIHRoaXMg
dHJpZ2dlciBhIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBvbiBtYXN0ZXItPmNsa3Mgb3IKPiA+
ID4gbWFzdGVyLT5jbGtzWzBdLmlkPwo+ID4gPgo+ID4gPiBXaGVuIGEgZGV2aWNlIHRyZWUgbm9k
ZSBoYXMgbm8gY2xvY2tzLCBkZXZtX2Nsa19idWxrX2dldF9hbGwoKSByZXR1cm5zIDAKPiA+ID4g
YW5kIGxlYXZlcyBtYXN0ZXItPmNsa3MgYXMgTlVMTCwgd2hpY2ggcGFzc2VzIHRoZSBtYXN0ZXIt
Pm51bV9jbGtzIDwgMAo+ID4gPiBjaGVjayBpbiBzdmNfaTNjX21hc3Rlcl9wcm9iZSgpLiAgUHJl
dmlvdXNseSwgdGhlIGZhc3RfY2xrIGxvb3AgaW4gcHJvYmUKPiA+ID4gcmFuIHplcm8gaXRlcmF0
aW9ucyBhbmQgcmV0dXJuZWQgLUVJTlZBTCwgYnV0IGFtbF9pM2NfaW5pdCgpIG5vdyBydW5zCj4g
PiA+IGZpcnN0IGFuZCBpbmRleGVzIG1hc3Rlci0+Y2xrc1swXSB3aXRob3V0IGNoZWNraW5nIHRo
YXQgbWFzdGVyLT5udW1fY2xrcwo+ID4gPiBpcyBhdCBsZWFzdCAxIChvciBlcXVhbCB0byAxIGFz
IHJlcXVpcmVkIGJ5IHRoZSBBTyBiaW5kaW5nKS4gIEluIGFkZGl0aW9uLAo+ID4gPiBvZl9jbGtf
YnVsa19nZXQoKSBsZWF2ZXMgY2xrc1tpXS5pZCBhcyBOVUxMIGlmIGNsb2NrLW5hbWVzIGlzIG1p
c3Npbmcgb3IKPiA+ID4gc2hvcnRlciB0aGFuIGNsb2Nrcywgd2hpY2ggd291bGQgY2F1c2Ugc3Ry
Y21wKCkgaGVyZSBhbmQgaW4gdGhlIGZhc3RfY2xrCj4gPiA+IGxvb3AgYmVsb3cgdG8gZGVyZWZl
cmVuY2UgTlVMTC4KPiA+Cj4gPiBUaGlzIG9uZSBuZWVkIGNoZWNrLgo+ID4KPgo+IHdpbGwgYWRk
IGNoZWNrLgo+Cj4gPiBGcmFuawo+ID4KPiA+ID4KPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAg
ICAgcmV0ID0gYW1sX2FvX2kzY190YWlsX2Nsb2NrcyhtYXN0ZXIsIG1hc3Rlci0+Y2xrc1swXS5j
bGspOwo+ID4gPiA+ICsgICAgICAgICAgIGlmIChyZXQpCj4gPiA+ID4gKyAgICAgICAgICAgICAg
ICAgICByZXR1cm4gcmV0Owo+ID4gPiA+ICsgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICsgICBmb3Ig
KGkgPSAwOyBpIDwgbWFzdGVyLT5udW1fY2xrczsgaSsrKSB7Cj4gPiA+ID4gKyAgICAgICAgICAg
aWYgKCFzdHJjbXAobWFzdGVyLT5jbGtzW2ldLmlkLCAiZmFzdF9jbGsiKSkKPiA+ID4gPiArICAg
ICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gPiA+ICsgICB9Cj4gPiA+ID4gKwo+ID4gPiA+ICsg
ICBpZiAoaSA9PSBtYXN0ZXItPm51bV9jbGtzKQo+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiBk
ZXZfZXJyX3Byb2JlKGRldiwgLUVJTlZBTCwKPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAiY2FuJ3QgZ2V0IEkzQyBmYXN0IGNsb2NrXG4iKTsKPiA+ID4gPiArCj4gPiA+
ID4gKyAgIGZjbGsgPSBtYXN0ZXItPmNsa3NbaV0uY2xrOwo+ID4gPiA+ICsgICBpZiAoSVNfRVJS
KGZjbGspKQo+ID4gPiA+ICsgICAgICAgICAgIHJldHVybiBQVFJfRVJSKGZjbGspOwo+ID4gPgo+
ID4gPiBbU2V2ZXJpdHk6IExvd10KPiA+ID4gVGhpcyBpc24ndCBhIGJ1ZywgYnV0IHRoaXMgZmFz
dF9jbGsgbG9va3VwIGFuZCB2YWxpZGF0aW9uIGR1cGxpY2F0ZXMgdGhlCj4gPiA+IGlkZW50aWNh
bCBsb29wIGluIHN2Y19pM2NfbWFzdGVyX3Byb2JlKCkgdGhhdCBydW5zIHJpZ2h0IGFmdGVyCj4g
PiA+IHZlbmRvcl9pbml0KCkgcmV0dXJucy4gIENvdWxkIGEgc2hhcmVkIGhlbHBlciBvciByZXNv
bHZpbmcgbWFzdGVyLT5mY2xrCj4gPiA+IG9uY2UgYXZvaWQgcmVwZWF0aW5nIHRoZSBsb29rdXA/
Cj4gPiA+Cj4gV2lsbCB0cnkuCj4gQW5kIGd1YXJkcyBhZ2FpbnN0IGEgTlVMTCBjbGtzW2ldLmlk
LCBhbmQgcmV1c2VkIGJ5IGJvdGggcHJvYmUoKSBhbmQKPiBhbWxfaTNjX2luaXQoKS4KPgo+ID4g
PiAtLQo+ID4gPiBTYXNoaWtvIEFJIHJldmlldyDCtyBodHRwczovL3Nhc2hpa28uZGV2LyMvcGF0
Y2hzZXQvMjAyNjExMTYtYTlfaTNjLXY0LTAtM2QzMjIyYjcxMjhkQGFtbG9naWMuY29tP3BhcnQ9
Mgo+CgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LWkz
Ywo=
