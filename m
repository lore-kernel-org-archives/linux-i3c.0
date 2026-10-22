Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED7E606A31A
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Oct 2026 11:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HULeqQjB;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=ESMczTLF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Cc:To:Subject:
	From:Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=rdMFQOOBOh1XBsvHtbbt7mjauW3HkiRoEBIVKwL9Euc=; b=HULeqQjBIacOGet8a4d6jmjqR/
	VG2uNF86fLvaqdlXaqDeiktwKruSfAU2rWfldboK+j9VMIEitHu/N1a4mkxhJRDCvnyKOWdp0kv/8
	IoFyG+Tm36Z70j3uT25THkvyW0JVWKeSz+CuzTQWegLgkEgVg3+WYQSfh+RWn02RISc4keapoj+WD
	Nam5+pPo0dv9cfgCQw6x+xmCY7xIIQ+DyTOkkX8t/dpL5SVyZa/Nx+0Tjg/nbVHWXHKq+MElzRLXD
	F73ted9VHl6p5m5/iwVqM5lIdFD6t1uYpmXehFKJPAPWcFQlwwoRXLAEZ6GhYRs6jAgipUW2+245Z
	fL1m9yHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrDa-0000000E1bm-0Fyv;
	Thu, 22 Oct 2026 11:44:22 +0000
Received: from mail-japaneastazon11022143.outbound.protection.outlook.com ([52.101.126.143] helo=TYPPR03CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xJrDW-0000000E1ac-2bV6;
	Thu, 22 Oct 2026 11:44:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=leXb9mQ41wQTfImzSJfgoJ6jlT/z7Gt0jxK4uN4a1emQ2DuGmSM05W3bRr2VgwEUndZVaWGAwkSW+C5VzxwYFxI66YVIFaotNXLO+8DlmM2HUwAJeXMf+ZmQSnDA7tdynZx74c5lbdmTuOzyT86sk/9BZSYCbT8Ml254fFDJP+hCcOV9q5zsUxGhsk+9qJJjeR0g4JVDH6639CtPzfcEz6r09TP2fiLqd26UiAbL0eCT77guuNpNOWLVSuNUwWvegppOaIIBCKDcwAG4/2FqzDFY1ww813CPEgkpwYQLb9quhN3Ws+JS5EAMsttkripFXHRgfFBM+s003hsyK6fFlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGIx2mYr1H8b/VUYu1u/ApjefmPuM8Lgrnb8EdFNicU=;
 b=VWya3e5ASXIb07T5c5Ws/lbFlqbOKkYrsGT1Vu7MHZkNM+lvwmjGDP1Tf6H4649Jl8ad532kQtMJ8cBiY8jB3P/05u1aSBgPsis5OCULE3okN+C/vcdMpR8EtbJP78wZSsCuRWJzE31dYCA4siDxvNEiAFb0wWUJ6FZYSB6TWNdCRGAjas+qMLXHTMSXxbKATcsnc10p2jZvpj71Jcg8+t87XnW1Ms8Xi2DkBBjYqzMW8Yi4Aq6O4NmssRyI3bFIpsXYlepOKDdRUJ3E6CjtPF7DegBGEdPEc7GGGm6yvnfHeXf+ukDUtIw8R0ZHr8bR3ZqfuzofSChxu2rtQ91NQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGIx2mYr1H8b/VUYu1u/ApjefmPuM8Lgrnb8EdFNicU=;
 b=ESMczTLFf36ctASmNazIVHo0JurFI6+teFaNGPHFzeThsWOgNI9TmMbKJw8qD75rorAepWUyOU7fhp6u/9mWgw7QAV72Qed3i9n2aNPu9MY9ySQ7cTVW29zFCx6Nsi3i/d8fSK359NASFq2BxYCrEN6HadclsVhDAZjoH/mwO4DwaRZ0ncQr/EFGq+FJn1+9nNobZgeuK2uTTZOqr4Xd6bmb+IUEVyty6hWhIISx3CQy6nw4QJm88CJPLkHFCEJvb4RxtyQlP3RJzQMF6U94P8ROffnRGsNMsVcY4+/fIbQ5NdqypiEkLJsuPZUZ2EwPovuTVJXCTG1Nominy5m1nQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com (2603:1096:400:74::7)
 by SEYPR03MB7968.apcprd03.prod.outlook.com (2603:1096:101:168::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Thu, 22 Oct
 2026 11:44:09 +0000
Received: from TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40]) by TYZPR03MB5743.apcprd03.prod.outlook.com
 ([fe80::7f51:5771:90c4:8c40%3]) with mapi id 15.21.0546.012; Thu, 22 Oct 2026
 11:44:09 +0000
Message-ID: <4da3cd55-0115-4817-a19d-18a69b7a7cc6@amlogic.com>
Date: Thu, 22 Oct 2026 19:44:03 +0800
User-Agent: Mozilla Thunderbird
From: Junyi Zhao <junyi.zhao@amlogic.com>
Subject: [PATCH 1/3] i3c: master: Rework SVC I3C to support vendor glue layers
To: Frank Li <Frank.li@oss.nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
 linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
 Kelvin.Zhang@amlogic.com
References: <20261019-a9_i3c-v1-0-329d819d621f@amlogic.com>
 <20261019-a9_i3c-v1-1-329d819d621f@amlogic.com> <atZ-YyEmG-KvUZAF@SMW015318>
 <887f0b2d-3a05-418b-bda5-0b01abbcb409@amlogic.com>
 <atjOD0PwVGDeh2uL@lizhi-Precision-Tower-5810>
Content-Language: en-GB
In-Reply-To: <atjOD0PwVGDeh2uL@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: SI2PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:194::10) To TYZPR03MB5743.apcprd03.prod.outlook.com
 (2603:1096:400:74::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR03MB5743:EE_|SEYPR03MB7968:EE_
X-MS-Office365-Filtering-Correlation-Id: 866d1f2f-de9f-48a4-f2d6-08df3031c8ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|261021121427099003|56012099006|11063799006|4143699003|261009223027099003|10067099003|18002099003|22082099003|261021123027099003|6133799003;
X-Microsoft-Antispam-Message-Info: xscYFe5Vw9zyXLI4Y+XnLybhG71tO1NWPjaU4fJVcpZwwtGn7aBMEl+4/2s6qWkTRGsU+bGX9d5usagUeD9BmMnCv0Jf4OHUmPATY0DbDGzd4VKPlKahL/hrLkZkTaPkT5or3b89MsQyGSpSEvxosOAKU+wpyAMN33cqONF8BqF24JCfmyfMvlQdi7uQLaJ6u9dTZw50xQWBqZtn/he+5twJOLC8JNzCzIZ8mVymcI6dTd6dgFRjbVNfAwKnTubL81dcC6W8WC4XHdtrB8/cQ0j49lf+3g/6PSRbklf9wrCWosqE1uZduvDjvTzuNDG+MR/LXc5JQMWqagTQXLRd7UDSKPQ2m+hP+rQ/SShExPf/7R5Z681OsowlyHlHPwZz8PUX8ca5OHIRHUBYIeCNGo2Ge/AaFTIHczksmlwXxxMP7uILVOjpXn1xjoOfRFbHcrF/1SiT4GjWhf00OcowMkW55QngG4yZSv0zsKR7YpYqdEu7csNz94EWtncbtLHC2sdj4LDHRREBWgquAxfbWrgfZrmdDnC7HfFmCa98A70u8VLbtgDPaiJyqYMbbdXOsOx0UMLhRqC3iUKyVwSOjGhP7fFtUalG5kVoEfQjKUwZm5RezLWr7KxFjliZGdAxt4UoFUOvnn2rPPp+XtnROmf+18Lw3x9SvknpO7QbKnk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYZPR03MB5743.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(261021121427099003)(56012099006)(11063799006)(4143699003)(261009223027099003)(10067099003)(18002099003)(22082099003)(261021123027099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1M3Q1VlWXNJMkJhNFBxY2lIL0Z2R1Zrbk5Lb1doSE03NGZHSFF3MDg4RXVh?=
 =?utf-8?B?Mk5BRlFBL2pqd2R1cGJSY2tCSjJSeUYraFowQXcxSTBZWTJqUit0QlFMOWg1?=
 =?utf-8?B?aTdQdzgrZzdidzIyc0FCcjBIQUk5TlpvNWo5eEhwa1QwQmZGS3R6QUJRdTJK?=
 =?utf-8?B?dWNkSm4rZmg5d2luaTFRcHV0bC82aEw5UWE1VzZBSUpPSmZPWmQ0MzJEVjBn?=
 =?utf-8?B?MGkyRjVxQThhcXU1RGlxSnV0VUNVOXJRMFdUY3crSVllWkxOYUsrek52LytD?=
 =?utf-8?B?TU5NV3FUZDczdWZlSHFWeGZRbGhOZHN6ZUhldVZaY2pwUGtYM1BDOCtRQU14?=
 =?utf-8?B?a3RTMW1GOHFLQmIyVC9oeG1iN2UxL1g0TzFVb2ZJcDI4bksxbjZ6b2JhcWVT?=
 =?utf-8?B?bHVPQnNnK3A1UmtqbGZ6NCtjV2luMmRCN2hENUZzNGpLOGc5NkR2Y01yQmcv?=
 =?utf-8?B?NFU2UUNLRmpwTXE1Tm81SW9ndUFkSmJIMkMwQWFFV095M3U1RXZtOFhmSnhG?=
 =?utf-8?B?cG5OWnlsei9jRjN2VEwxcklqcWlnanMzOG9rWXRrajVtWlZBcW5xSEd1QUYx?=
 =?utf-8?B?QkdLWjVxajlPQlZZUzVBNmY3L1pPbVBHdEtvNllubnY4SkgzVlY1MGdnSGZ4?=
 =?utf-8?B?aFhUY3Vzbm9XbUlaK0hNTVI2YnRZclVva2UzT3daY21KenNtMnB3cGhMK1Er?=
 =?utf-8?B?MEZ2UW1PTHArSHJIQ0xSYlllTDFZZnIxK3JZT0l5T3E5ME5CTVhTT2QvWm43?=
 =?utf-8?B?M21USW9jU0hJQmZ6NmFDeE9vb1NHNzBZSHF6Nk1sTXdsMmNMZFR2WFVWZjhT?=
 =?utf-8?B?R3Q2K04reUNpMzZGYXVtYkllTGVZRGJqbnVnVk9ZYzQ1N0FCaHhsNUFkYzlp?=
 =?utf-8?B?TEw5bVRjS2lUSkt0cll3R1RZR2Z5NE1hVFFjSGdWVU5VZjZJbVViNHNDdXZk?=
 =?utf-8?B?NDhQYWtjQmFlWDJSTWovVWtwRDE1NnF1QmVZY2dZMHd3N0lxTjVBTlFNT1g4?=
 =?utf-8?B?MTZYYmRGb3NscnFvMFozRlRhWUV1ZWp4VDZVZDJkSExVLzFoRmxRQlVKSnRh?=
 =?utf-8?B?WmQxeUxOMG1YdkZ0R01sak5qSXBKNkxaM0RwdDRpck1pOGtYWWNMd2d4bGxV?=
 =?utf-8?B?dE4rZXJPckJwZk1RZWFyZkR2a0xlVHBJMzB3MDhtRERWZjJHa3pscGxqZFZj?=
 =?utf-8?B?Q0lOM3RkbDhwaWc4Y1RyZU1pWFBEUXN4MHRjTUVUQkJObWVqYnBKTTh1UTUx?=
 =?utf-8?B?UVIrMitEQllCZkVMNUZEY1cyMnUvMkk0OVR3ZHRyWnhpbzNCa1E3aFlzSXNu?=
 =?utf-8?B?UTU4RmlmSXhqSUVtZkJ1RGllRGlod0pKYVRBSHR5eFB4Mmpsall2ekpyQTRQ?=
 =?utf-8?B?WjhrbEJvaWtqb1Z0MzlkbGFyQjZUM3BzT3ZFZ01XUVlPT1o1RnRRK0JNZi9h?=
 =?utf-8?B?TEY4ZWVvaVNsSjcxVklvd1FnR1ZrU1RmWDZFOVJ0R3VQLzdZWDFlOTNtN1k4?=
 =?utf-8?B?MU5ROWlKdWFFNFVkM3IrYXFBK3lzYkUzblhCZzZ5SXpab3VTUWV2SHVXT0Qv?=
 =?utf-8?B?Z0ZqeHBCdEtuNit1RzRoSXdhdVR3YnRiL1lBekZBS0VUSnZOMVMwU3dSTTRT?=
 =?utf-8?B?RHIwMlA2VEZ5VHQ3dkFmSzlGRnBtbGwrTkNyai9vS2FBSXZ1YjUzM0E2cks5?=
 =?utf-8?B?TGxFQXdSSXZwTlJoY2xaQTI1TWZkZ1FHajU1K3E3VU4wY2JMb2xjUEhEdHR2?=
 =?utf-8?B?WjNRTjhLWjBudklzd0JjcHhSb2dYTWV3WGNSbG1hNlpLbXloS0hqOE1SR1dm?=
 =?utf-8?B?M0RCOG92a2pSSHQxR01uYzRoanZLTjc1aE9QeEZhc1pGM1FiRHlIaktFSjdv?=
 =?utf-8?B?eWJVbzZiMTdIb2VySWxiSFVaRDJpc2djaGxqN3NDWnNNWjhYWHhGV0pDM1FJ?=
 =?utf-8?B?K0JGZFE4bGlIeVZQRjVOUS9uRjJYMGtCS3VkN0hqR0lab0RlRFpEbERUaHUz?=
 =?utf-8?B?a2ZtSkI0dkVvam5jaFBtS2hoM2JRN3ZHSG44RmxWUGo0RERCTkt0cUpwUDlh?=
 =?utf-8?B?ZjViaktsQXoxOVZxNUpIVmNEak9ZQUxMK1M4aCtlU3ZuNjNYUkpHejhqM2kv?=
 =?utf-8?B?ZmdDYlNFL29kWjNocmx1eXcwUUZkK3VaKytPb01PUnZVM3RWeGRLbGZmdGNK?=
 =?utf-8?B?TVliYWVVaFVkMFFjcWRDMDAwQS9KL1lxSGt6Yi9PRzVaQ0tzVDVyd25VbVhx?=
 =?utf-8?B?NXQ3QnM0cnQyYmhabjEzY0FScVY5TWpJZHVmdUpHTkkyNHNjWkZJYWx5Z2M5?=
 =?utf-8?B?eDd4M2h0b1VaNGYxYldhNjV4QXlXZjdNNkZZZ24xTGlMNTRVSGI2Zz09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 866d1f2f-de9f-48a4-f2d6-08df3031c8ca
X-MS-Exchange-CrossTenant-AuthSource: TYZPR03MB5743.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2026 11:44:09.2601
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: umr+7D8HDT8iInYpkHMKhgwXiUWQUTzd51vHW+4eiomhd1+3BATaAYNi4rW43O13rZ/nnEibtqBOsG+CtyyZeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR03MB7968
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_044418_702459_16BC77E0 
X-CRM114-Status: GOOD (  26.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgZnJhbmvvvIwKCXRoa3MgZm9yIHlvdXIgZGV0YWlscy4KCk9uIDIxLzEwLzIwMjYgMjI6Mzcs
IEZyYW5rIExpIHdyb3RlOgo+IFsgRVhURVJOQUwgRU1BSUwgXQo+IAo+IE9uIFdlZCwgT2N0IDIx
LCAyMDI2IGF0IDEwOjU2OjE5QU0gKzA4MDAsIEp1bnlpIFpoYW8gd3JvdGU6Cj4+IEhpIEZyYW5r
LAo+Pgo+PiBUaGFua3MgZm9yIGxvb2tpbmcgYXQgdGhpcy4KPj4KPj4gQW1sb2dpYyBBOSB1c2Vk
IHRoZSBzYW1lIFNWQyBJM0MgSVAgZW5naW5lLCBidXQgdGhlIGludGVncmF0aW9uIG9mIGl0Cj4+
IGRpZmZlcnMgaW4gdGhlIHJlc291cmNlcyAqYXJvdW5kKiB0aGUgY29udHJvbGxlciwgd2hpY2gg
Y2Fubm90IGJlCj4+IGV4cHJlc3NlZCBhcyBhbm90aGVyIHF1aXJrcyBlbnRyeToKPj4KPj4gLSBP
biB0aGUgImFvIiBpbnN0YW5jZSB0aGUgYnVzIGNsb2NrIGlzIGdlbmVyYXRlZCBieSBhbiBpbnRl
cm5hbAo+PiAgICBkaXZpZGVyIChJM0NfQU9fRkNMS19ESVZfQ1RSTCBAMHgzMDQpIHByb2dyYW1t
ZWQgZGlyZWN0bHkgYnkgdGhlCj4+ICAgIGRyaXZlcjsgdGhlcmUgaXMgbm8gQ0NGIGNsb2NrIHRv
IGNsa19zZXRfcmF0ZSgpIG9uLCB3aGlsZSB0aGUKPj4gICAgY29tbW9uIHByb2JlIGFzc3VtZXMg
dGhlIGZjbGsgaXMgYSBwbGFpbiBlbmFibGUtYWJsZSBjbG9jay4KPiAKPiBJZiBpdCBpcyBpbiBJ
M0MgbWVtb3J5IHJlZ2lvbiwgeW91IGNhbiBkbyB0aGF0IGJ5IHVzZSBjYWxsYmFjay4gb3RoZXJ3
aXNlCj4gc2hvdWxkIGdvIHRocm91Z2ggY2xvY2sgZnJhbWV3b3JrLgoKVGhlIEFPIGRpdmlkZXIg
cmVnaXN0ZXIgaXMgaW5zaWRlIHRoZSBJM0MgbWVtIHJlZ2lvbiwgc28gSSdsbApoYW5kbGUgaXQg
d2l0aCBhIGRydmRhdGEgY2FsbGJhY2suIEknbGwgYWxzbyBldmFsdWF0ZSBOZWlsJ3Mgc3VnZ2Vz
dGlvbgpvZiBtb2RlbGluZyBpdCBhcyBhIENDRiBjbG9jayBmb3IgdjI7IGlmIHRoYXQgd29ya3Mg
b3V0IGNsZWFubHksIHRoZQpjYWxsYmFjayBnb2VzIGF3YXkgZW50aXJlbHkuCgo+IAo+Pgo+PiAt
IEFtbG9naWMgYWRkZWQgcmVnaXN0ZXIgYmxvY2tzIG91dHNpZGUgdGhlIFNpbHZhY28gbWFwOiBh
Cj4+ICAgIERNQSBicmlkZ2UgYW5kIGEgYnVzIG1vbml0b3IgKDB4MjAwLi4weDIyYykuCj4gCj4g
RG9lcyBETUEgYnJpZGdlIG9ubHkgZm9yIEkzQz8gSXQgc2hvdWxkIGJlIGdvIHRocm91Z2ggc3Rh
bmRhcmQgRE1BIGVuZ2luZS4KPiAKPiB3aGF0IGJ1cyBtb25pdG9yIHVzZSBmb3IuCj4gCj4+ICAg
IEVuYWJsaW5nIHRoZSBETUEgYnJpZGdlIGxhdGVyIHdpbGwgbmVlZCBob29rcyBpbiB0aGUgY29t
bW9uCj4+ICAgIHRyYW5zZmVyIHBhdGguCj4gCj4gV2UgYWxzbyBuZWVkIHN1cHBvcnQgRE1BIGlu
IGZ1dHVyZS4KClllcywgdGhlIGJyaWRnZSBpcyBkZWRpY2F0ZWQgdG8gdGhlIEkzQyBjb250cm9s
bGVyLCBhbmQgdGhlIGRhdGEgcGF0aAp3aWxsIGdvIHRocm91Z2ggdGhlIHN0YW5kYXJkIGRtYWVu
Z2luZSBmcmFtZXdvcms6IG91ciBTb0MtaW50ZXJuYWwgRE1BCmNvbnRyb2xsZXIgaGFzIGl0cyBv
d24gZG1hZW5naW5lIGRyaXZlciwgYW5kIHRoZSBJM0MgZHJpdmVyIG9ubHkgdXNlcwp0aGUgc3Rh
bmRhcmQgc2xhdmUgQVBJIC4KCiJETUEgYnJpZGdlIiBpcyBhIHNtYWxsIHNldCBvZiByZWdpc3Rl
cnMgaW5zaWRlIHRoZSBJM0MgbWVtIHJlZ2lvbiwKICB3aGljaCBhZGFwdCB0aGUgSTNDIEZJRk9z
IHRvIHRoZSBTb0MtaW50ZXJuYWwgRE1BIGNvbnRyb2xsZXIuIApQcm9ncmFtbWluZyB0aGVtIGlz
IHBhcnQgb2YgdGhlIEkzQyBjb250cm9sbGVyIGluaXRpYWxpemF0aW9uLCBub3QgcGFydCAKb2Yg
dGhlIERNQSBlbmdpbmUgY29uZmlndXJhdGlvbi4KClRoZSBidXMgbW9uaXRvciBpcyBhIGRlYnVn
IGJsb2NrLCBub3QgbmVjZXNzYXJ5LCBpIHdpbGwgZHJvcCBpdC4KCj4gCj4+Cj4+IEFkZGluZyBB
OSBzdXBwb3J0IHRvIHN2Yy1pM2MtbWFzdGVyLmMgZGlyZWN0bHksIHdvdWxkIG1ha2UgdGhlc2UK
Pj4gYmVjb21lcyBpZi1icmFuY2hlcyBpbiBwcm9iZSgpL1BNL3RyYW5zZmVyIHBhdGhzIG9mIHRo
ZSBzaGFyZWQKPj4gZHJpdmVyLCBhbmQgdGhlIG5leHQgdmVuZG9yIHJlcGVhdHMgdGhhdC4KPiAK
PiBZb3UgY2FuIHVzZSBjYWxsYmFjayBmdW5jdGlvbiBpbiBkcnZkYXRhLgo+IAo+PiBXaXRoIHRo
ZSBnbHVlIGxheWVyLAo+PiBpM2MtbWFpbi5jIGtlZXBzIHRvZGF5J3MgbG9naWMgdW5jaGFuZ2Vk
OiBpM2Mtc2lsdmFjby5jIGlzIHRoZQo+PiBjdXJyZW50IHByb2JlIGNvZGUgbW92ZWQgYXMtaXMg
KHJlbmFtZSB3aXRoIDc5JSBzaW1pbGFyaXR5KSwgc28KPj4gYmxhbWUvaGlzdG9yeSBpcyBwcmVz
ZXJ2ZWQuCj4+Cj4+IElmIHRoZSBmaWxlIG1vdmUgaXMgdGhlIG1haW4gY29uY2VybiwgSSBjYW4g
a2VlcAo+PiBzdmMtaTNjLW1hc3Rlci5jIHdoZXJlIGl0IGlzIGFuZCBvbmx5IGV4cG9ydCB0aGUg
YWxsb2MvcHJvYmUvcmVtb3ZlL1BNLwo+PiBpbnRlcmZhY2UgZm9yIGdsdWUgZHJpdmVycyAtLSB0
aGUgZXNzZW50aWFsIHBhcnQgZm9yIG1lIGlzIGtlZXBpbmcKPj4gdGhlIHJlc291cmNlIGhhbmRs
aW5nIG91dCBvZiB0aGUgY29tbW9uIGNvZGUgcGF0aHMuCj4gCj4gTm93LCB0aGVyZSBhcmUgbm90
IG11Y2ggdXNlciB5ZXQuIFJlbmFtZSBvciByZS1vcmcgb25seSB3aGVuIGl0IGJlY29tZXMKPiBj
b21wbGV4IGVub3VnaC4KPiAKCk9rYXnvvIwgaXNlZSB5b3VyIHBvaW50LgpJJ2xsIGtlZXAgc3Zj
LWkzYy1tYXN0ZXIuYyBhcyBhIHNpbmdsZSBmaWxlIGFuZCBhZGQgb3B0aW9uYWwgY2FsbGJhY2tz
IAp0byBzdHJ1Y3Qgc3ZjX2kzY19kcnZkYXRhIGluc3RlYWQgb2YgdGhlIHNwbGl0IGFuZCByZW5h
bWUuCgoKPiBGcmFuawo+IAo+Pgo+PiBBbHNvLCBwZXIgTmVpbCdzIHN1Z2dlc3Rpb24gSSdsbCB0
cnkgbW9kZWxpbmcgdGhlIEFPIGRpdmlkZXIgYXMgYQo+PiBDQ0YgY2xvY2sgaW4gdjIsIHdoaWNo
IHNob3VsZCBkcm9wIG9uZSBob29rLgo+Pgo+PiBUaGFua3MsCj4+IEp1bnlpCj4+Cj4+Cj4+IE9u
IDIwMjYvMTAvMjAgNDozMiwgRnJhbmsgTGkgd3JvdGU6Cj4+PiBbIEVYVEVSTkFMIEVNQUlMIF0K
Pj4+Cj4+PiBPbiBNb24sIE9jdCAxOSwgMjAyNiBhdCAwMTozNDoyNlBNICswODAwLCBKdW55aSBa
aGFvIHZpYSBCNCBSZWxheSB3cm90ZToKPj4+PiBbWW91IGRvbid0IG9mdGVuIGdldCBlbWFpbCBm
cm9tIGRldm51bGwranVueWkuemhhby5hbWxvZ2ljLmNvbUBrZXJuZWwub3JnLiBMZWFybiB3aHkg
dGhpcyBpcyBpbXBvcnRhbnQgYXQgaHR0cHM6Ly9ha2EubXMvTGVhcm5BYm91dFNlbmRlcklkZW50
aWZpY2F0aW9uIF0KPj4+Pgo+Pj4+IEZyb206IEp1bnlpIFpoYW8gPGp1bnlpLnpoYW9AYW1sb2dp
Yy5jb20+Cj4+Pj4KPj4+PiBUaGUgU1ZDIEkzQyBjb250cm9sbGVyIElQIGNhbiBiZSBpbnRlZ3Jh
dGVkIGludG8gU29DcyBmcm9tIGRpZmZlcmVudAo+Pj4+IHZlbmRvcnMuIFBlcmlwaGVyYWwgcmVz
b3VyY2VzIGFzc29jaWF0ZWQgd2l0aCB0aGUgY29udHJvbGxlciwgc3VjaCBhcwo+Pj4+IGNsb2Nr
cywgbWF5IHZhcnkgYmV0d2VlbiB2ZW5kb3IgaW1wbGVtZW50YXRpb25zLgo+Pj4+Cj4+Pj4gUmV3
b3JrIHRoZSBkcml2ZXIgdG8gc2VwYXJhdGUgY29tbW9uIGZ1bmN0aW9uYWxpdHkgZnJvbQo+Pj4+
IHZlbmRvci1zcGVjaWZpYyBleHRlbnNpb25zLiBUaGUgY29tbW9uIGxvZ2ljIGlzIHNoYXJlZCBh
Y3Jvc3MgYWxsCj4+Pj4gaW1wbGVtZW50YXRpb25zLCB3aGlsZSBwbGF0Zm9ybS1kZXBlbmRlbnQg
b3BlcmF0aW9ucyBhcmUgcHJvdmlkZWQKPj4+PiB0aHJvdWdoIHZlbmRvci1zcGVjaWZpYyBob29r
cy4KPj4+Pgo+Pj4+IEFsc28gYWRkIGEgY29ycmVzcG9uZGluZyBNQUlOVEFJTkVSUyBlbnRyeSBm
b3IgdGhlIFNJTFZBQ08gSTNDCj4+Pj4gY29udHJvbGxlci4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYt
Ynk6IEp1bnlpIFpoYW8gPGp1bnlpLnpoYW9AYW1sb2dpYy5jb20+Cj4+Pj4gLS0tCj4+Pgo+Pj4g
Tm8gYmlnIGRpZmZlcmVuY2UuIE5lZWRuJ3QgcmV3b3JrIHN2Yy1pM2MtbWFzdGVyLmMsIHlvdSBj
YW4gYWRkIGFtbG9naWMgYXQKPj4+IHN2Yy1pM2MtbWFzdGVyLmMgZGlyZWN0bHkuCj4+Pgo+Pj4g
RnJhbmsKCgotLSAKbGludXgtaTNjIG1haWxpbmcgbGlzdApsaW51eC1pM2NAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LWkzYwo=
