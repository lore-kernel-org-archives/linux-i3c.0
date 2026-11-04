Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D285606A326
	for <linux-i3c@archiver.kernel.org>; Wed,  4 Nov 2026 03:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1rqpsguY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=GK+DpVSt
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GeoTX9k+7phApJgJtNIlw6EIt50RMLiKy18j+DLNXoo=; b=1rqpsguYULPzMoYP8KE34pULel
	VcON/ssFJbkq8Nl7VViouXAWrdERuUKE4pEsAn9o4tU2g8FdWLF8yagkUC/aJyiM7J59jB3bvAiyu
	3y7wthZrsFWgYf2YY+I8jvI+d4cg03zJKPHibNhuFzUrqo+jNwccGAxzzFzgnlyn8ugla1wCEOET7
	UZRT8ly9bO1hHWarZUvv/NFr6yBlnYbtcD0nIJfNk99cyax9MlZ4NBPqd/XMyESxLZxtnoWiy41Cp
	f1jKdWSn3zMuAvzviykniBruFTBM2D/i+YGgPeJ5qwagd/LsAC6LuNgwtrAASZLXNIPE4LS7MfTqH
	MsclMJ+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORX3-00000004FXn-1VQm;
	Wed, 04 Nov 2026 03:19:25 +0000
Received: from mail-westeuropeazon11013050.outbound.protection.outlook.com ([52.101.72.50] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xORWy-00000004FWy-29H5;
	Wed, 04 Nov 2026 03:19:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j+UOr9dE28RY6b9f2rIMVXBtu73U//gN51zaiVR8q/wiU/WSp1wpd5qHm6rR1KlBOCXO6c/LUFZiKT/gzxnpBokooKjSoS9ZN57q5Z0QYx8djQgqPzQA0s4Xa1Pz1vkElGJIWdOSPA/ZM+lordmrFk1AnBMopQq7v0BjLm6Cxs2huONN9iHcts1x+8Z6gjNSyLyVLq7gGNGZAKoUpaDWey5/i9hNimX8GH3HNyrf78NH4Z82jfgJ2BGOIyUR66vDf3lNAYJSaxTtTqB2DH14vAiRgu/WdL9ox4rd6H3yylwZKRyiT66EH34QML99ky+HR0a+eKcT//wBMXYYNKYXFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXtrBbmGOYkPkFX0HZwSlk0aemHbz+sUGKOT2HS83rg=;
 b=tlrvXSmxn/QhZaCiEiPzeXIaH7Y/keU+shEU2GFhnbkT6cccB21Jc2vst4WFXZeLPE2JlmDvD2KjzI6FcXi6mjWq+s7RjiWt9VF3c1ulkYJyDz0V5FeCF0/gcMwyXpI4AzuppwFbGxVH2hswmMthB+P3vKb/eiqTB/gsYA5ejN4l6oucGZMIOyCZVDd5m6/xk50m+EVMxhTcbI+vtwT737RQvctOWs+OYm/Pbb/DwHiSNYV6XP6la//yOdlVO0kKx/lC6aKEiICbaHaVSX/alVNFJCXu2QIJo/1B8HaoxnWDfN6RSYEyRNMMGw2kG/PqjFTNOrtizCZWEMqiit0E3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXtrBbmGOYkPkFX0HZwSlk0aemHbz+sUGKOT2HS83rg=;
 b=GK+DpVStA+PsE0AFyVAAiXKQjNCZgabsD/dls6lKX56OxcyiMGf0TL+UjUL4K6cqLWNMKWxB+RgsCSyucZCjxciOopL9pbCd2/iJe/HEl4bX20HkTK6kFcyZrMvQO1YxkeID9sm20T7zzcMgNd9/egFrjKkuHpbR/Vf0k8MmPk3q5M+CVEV4t9sMBoxlvtLtp6EirtNxbd6GZ9iCMXmKxWAMXT5dqkGkGmNLDBF2zJ5hDBuW6B92z5ZO4fv1TaGV9L7pDTpOZ8ifDl6D0Sf3VBhHVgeVR7kKpkLS2VBMKU4DknPP1Sfm/xGD5LTCpt2hNyOAz8cgrC7lcYL0vi+Wog==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by DU2PR04MB8518.eurprd04.prod.outlook.com (2603:10a6:10:2d1::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Wed, 4 Nov 2026
 03:19:16 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 03:19:16 +0000
Date: Tue, 3 Nov 2026 21:19:04 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Junyi Zhao <junyi.zhao@amlogic.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org, imx@lists.linux.dev,
	linux-hardening@vger.kernel.org, xianwei.zhao@amlogic.com,
	Kelvin.Zhang@amlogic.com
Subject: Re: [PATCH v2 1/2] i3c: master: svc: Add amlogic a9 support
Message-ID: <auqkKAKRZZ0pA-R3@SMW015318>
References: <20261102-a9_i3c-v2-0-0c474bfccffa@amlogic.com>
 <20261102-a9_i3c-v2-1-0c474bfccffa@amlogic.com>
 <aukKRUYfEABgIruC@lizhi-Precision-Tower-5810>
 <2210c679-0577-49b9-b8c9-fffe1d88baed@amlogic.com>
Content-Disposition: inline
In-Reply-To: <2210c679-0577-49b9-b8c9-fffe1d88baed@amlogic.com>
X-ClientProxiedBy: PH8P220CA0014.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:345::18) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|DU2PR04MB8518:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d591225-4db7-40ef-edf1-08df3a226830
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|7416014|19092799006|261102123227099003|4143699003|11063799006|261022105027099003|56012099006|261021121427099003|261026121527099003|261028144727099003|261026140227099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info: K+MdkxuqIYTcmOlJEWCX86TSKwZPkum377kiklIJEN8hBK01ccwx04KPEJboaf5pXRDaSn0YWIoOfltxGtloomcAXEy0/Tim0Ji4NfOKUNzf+lab7QjLmnXk2VEr2qwXpE5cdBroBtJJq/l6z0BXNgEpUfBSXmfwA7e7r2iX+QsstQL939sK6Y5QFl9N35VVaJDXxTw2ZFn4ERW9kLXCxlz3P6yRKHlrHjzv0M84gda12EUpgTlbJ2QmuyKZtQZb0NkXS+MPPy1N9ZH40KDe++TJJH1RM7WAC6H4FNHwKB6SyKVkh9cpjmkHX/kxQ6ml11R9n2ZGdYiS13HGVL0ShQl9Ole5GdHnKY+GCPCwU7Oey0xyOQTSwj/s9zYKcVuKiDb3U9czvCiRSUkUTbEZeIiacbwL5bw9guAPDtt9LZztXeFnx5LKr1bnZ3pXHBu7NfKvfoIWMOXYfsepQqt2RHnEoqds52+MECXsnfkQqI5wb1h7R6Te6/09NdnysWhdHbHT6YIprzS7rD+FeLXEE4PSxUoBcVRaO852hC4YPTs2elBuuHVFu7zIUFkysNJK23xMGZ9GTjo2s/9DeMYut00rT3v//s4YXyuACB0tTI2j4WY6mRx+iqn3CNdr5Q5XcEsXlkgCAzgp2x+Ns3O51Z2KJuIUelTM72HRUqxSOzM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(7416014)(19092799006)(261102123227099003)(4143699003)(11063799006)(261022105027099003)(56012099006)(261021121427099003)(261026121527099003)(261028144727099003)(261026140227099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzhaWlhJQUVmY2VZeUdMUUlOcjdiQnRXU1YwMmpGSllhNjhGMDduYkxCWG12?=
 =?utf-8?B?RU4wTUZYRkh5aW5yQ2xwSjg5Z3Z5VlU5RXE5TlFKa0g5eVVOTE9QWjJ2ai82?=
 =?utf-8?B?R01Gdi9Ld1l0QUFWVEp2eGJ1VHAvZUxzdXkzUElWdE5vMVlTSHVHc21tanNJ?=
 =?utf-8?B?Mkd0dVVZNEp5NEltQWY4c3Z3YjZqTW9GQWVxeSsvN2ZsSk5veVFDTXZ5bzhO?=
 =?utf-8?B?NXU4K0dnR0pHYTZxdVh0cE5lWWp3QUdmaklUZWFNVThqeXp3YjFTYkNZZStl?=
 =?utf-8?B?YStEU0FHMThkMjhhY3o2dVEwZm84RHg2N1p2SWYzZmRRdkplb00vK3lrUWdF?=
 =?utf-8?B?dnlRRnp6MlQvMXdKOGNCblN1TFBtd3dGdnFKcDk0NHpXYk83NmpZVTFFMWE1?=
 =?utf-8?B?STZpWFYzNENtRDM4ejAzVCtCY2tYNHRHMEQ1eG81bFViZVJXeXBNTzZsWW1w?=
 =?utf-8?B?Z0w5dWlra3YwSFlkSmxxbTdiaUJmUC9TUEhpbzF6YlBaZ3BMaGdndi9LRTFZ?=
 =?utf-8?B?cmo3RjBuWnlJZkxuT2ZaaWhVUGhncE8zNm5mdnFrbTN4anQ5YVF1ZzBhMzlQ?=
 =?utf-8?B?YlNUSEt0VnAvWGU1eEEwSFN6TjJ0cXZYL3MvTnJMVU1Uam9FaVo5TzdNaDZi?=
 =?utf-8?B?THhlc3dqUE5mY29BWkRGMXVXeTlCTkFEcFNxYjZmSjEyaW1tbWk1Z2VZbnRv?=
 =?utf-8?B?OCtac3BRa2c5ZkNyRkUxaGV1Ky9pYVdtNk4yV090eWhiZ2dyTzR4MHV1NVNZ?=
 =?utf-8?B?VVFSbWxldXRiR3JmUjFERU5wbHg0aDdlNlJvWVYyUUhyZzFMdDNGNXRCN0VP?=
 =?utf-8?B?cHEydUh2TSttcnFGcU9JaURUNW9MRlFmYTM2M0kwdDRHQlorNUcrSExkRnJi?=
 =?utf-8?B?THQxbXZmTFkzMnJjR2JvcGllVmFZM2p6YkM3clZ3NkFST1c5NmwzajZkM1Vz?=
 =?utf-8?B?QTJtWVJUOFVCNjAwYWN5WVQrUGR5K0Urek4vUUtDdUJoWjhpVGgrV0c4VnJl?=
 =?utf-8?B?V21xc3M1TjJDcnF5UHl3aVl5UmVpc2c5Tkc2WUo3NGNickRFRmZCcm81VWtH?=
 =?utf-8?B?bjBJbWdYdmF0ejUrSUExVkpGNUR0ZXVmd2dhd0hzMU9kREd4a256Y2E3VUs4?=
 =?utf-8?B?cnBXOTBnamt5akQxTmxoMXIzV0ZvNlJvUEpkaXJieU9XT1JIOUxEVjZYUktv?=
 =?utf-8?B?REgyRmwrSHV6Y2hRNmdKN3IzMkd5UXdEblpEcU1aNEJXQk1pdVA0aldVYUNy?=
 =?utf-8?B?ZHRRU1gySDMzMmpRNUpLL2FWY29za25uc3Uza0RjK0hobnMrM2E0UkRoRzB4?=
 =?utf-8?B?V3M5elZ0U2xuTXBVdXNZY3FIdGN6N0phT3Y0Q3YwWGpBTnRQUHFaeitiQVBP?=
 =?utf-8?B?REFPbWFDVGJiei8ySFZSUGhRNEc3eDNFNllDU2JpSkFkcWpQb1pOMy91T0lu?=
 =?utf-8?B?cnBvbUlpN3cwNzdieHZMTlhpeWZ5NkFjVENUZzFWMHNwV2RvamJrVzJ0QzZp?=
 =?utf-8?B?MzhoOC9qeUxEckNEa1VzMFQ3ZG9GM1FLenVxbDUzQjYwVTlmWk5WNTZYazBQ?=
 =?utf-8?B?N1dibDNGVElRRGl6eHpCOUsvdktFZkVYL0Q0T25DSGNGUWQzUFdhYk13djdW?=
 =?utf-8?B?UEoxOEFoSituR2ZwRXF0ZkJyZmVEYlJvSlRWeDVpelZ6TXQ0WW8zUWxtV1FR?=
 =?utf-8?B?MVRxWHZEUlVJd1FnN1pwZE1Bam8zUm1OQkFiNEZ0ZWczNDNTVHBEbytRcFBp?=
 =?utf-8?B?VDBRdXFockVpNFUxRFp0eHFSNjJOOFJKTmNRSWJhRmhTc3Q1eVVEcTJGR1M2?=
 =?utf-8?B?TGJBak9NdEw5Qkx6c1J4eitzZHFYb1lvT0Y4aWtXcnBEd01YbGVnREdteWE5?=
 =?utf-8?B?SUVXZTJQQm9WNlI4RXVzZzNsZ0pleU1RaHAxdlJjVGthYnRCME1sa0IvQ243?=
 =?utf-8?B?ek9oemsvZS9JSzQxekwwSEdOcTBlMDEyMkVrMzA0b1VsZEdxNHUvR3duWFBv?=
 =?utf-8?B?ZC9yRDJTWkJ2clhEcHZDajM0d05NY0FuQlNLbU0yOUE2Y3kvM2JBZVJHTXJF?=
 =?utf-8?B?VDM4Vm1ac3h4VkdKb3ZKM1pJdGRnNUVxaUREOGpSUzJNYWRrMlluTXFsbm5E?=
 =?utf-8?B?UW0yM3NmcHdJakRPdXp4K0hBclVVODkzTER0OXptUGZ1Q0VQRVpmNmVIN3Nk?=
 =?utf-8?B?Vnh3YWN0eEpRQnM3aE1LZHEzaW1xTUF6RysxNUFVL0oyNHNDbDNMWHpwTHg3?=
 =?utf-8?B?NHlPc09jNEtnaE5hRnpleWo2OHRqaTk2T2ExOXNlZWpPcjBWcVlVZ3hCay84?=
 =?utf-8?B?aUZENXVGYWs3NlN3dWlhS0k0eWZ5RnFJVVVwU2dLZTZyb3ZEM2tYYngwV3lr?=
 =?utf-8?Q?oQalsozGHjycacRtDOuutLzLydHZt+2edvPES?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d591225-4db7-40ef-edf1-08df3a226830
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 03:19:16.3423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3n8ET5vm9fPQyp3hcchvUN3YVSHwXHrJgU2HBZ5+cQ2CI2TA+ysg4QQDKyMk51yR247nRNM8hM6X5xva7u16VYK5lbSZWArWpaGnBPq4g49c3okdsMmHAH4XgRSS3VRD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8518
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_191921_876294_EB0C2762 
X-CRM114-Status: GOOD (  20.64  )
X-Spam-Score: -1.9 (-)
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
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gV2VkLCBOb3YgMDQsIDIwMjYgYXQgMTA6NDQ6NTlBTSArMDgwMCwgSnVueWkgWmhhbyB3cm90
ZToKPiBIaSBGcmFuaywKPgo+IFRoYW5rcyBmb3IgdGhlIHJldmlldy4KPgo+IE9uIDAzLzExLzIw
MjYgMDY6MTAsIEZyYW5rIExpIHdyb3RlOgo+ID4gWyBFWFRFUk5BTCBFTUFJTCBdCj4gPgo+ID4g
T24gTW9uLCBOb3YgMDIsIDIwMjYgYXQgMDc6MDU6MzlQTSArMDgwMCwgSnVueWkgWmhhbyB3cm90
ZToKPiA+ID4gQW1sb2dpYyBhOSBTb0NzIGludGVncmF0ZSB0aGUgU2lsdmFjbyBJM0MgSVAsIGFu
ZCB0aGVpciBwZXJpcGhlcmFsCj4gPiA+IGNsb2NrcyB2YXJ5IGZyb20gdGhlIHZhbmlsbGEgaW1w
bGVtZW50YXRpb246Cj4gPiA+Cj4gPiA+ICAgIC0gVGhlIEVFLWRvbWFpbiBjb250cm9sbGVyIChh
bWxvZ2ljLGE5LWkzYykgdGFrZXMgdHdvIGNsb2NrcywKPiA+ID4gICAgICAicGNsayIgYW5kICJm
YXN0X2NsayIsIGFuZCB0aGUgZmFzdCBjbG9jayByYXRlIG11c3QgYmUKPiA+ID4gICAgICBwcm9n
cmFtbWVkIGJlZm9yZSB0aGUgY29udHJvbGxlciBjYW4gYmUgdXNlZC4KPiA+ID4KPiA+ID4gICAg
LSBUaGUgQU8tZG9tYWluIGNvbnRyb2xsZXIgKGFtbG9naWMsYTktYW8taTNjKSBleHBvc2VzIG9u
bHkgInBjbGsiOgo+ID4gPiAgICAgIGl0cyBidXMgY2xvY2sgaXMgZ2VuZXJhdGVkIGJ5IGFuIGlu
dGVybmFsIGRpdmlkZXIgbG9jYXRlZCBpbiB0aGUKPiA+ID4gICAgICBjb250cm9sbGVyJ3Mgb3du
IHJlZ2lzdGVyIHNwYWNlLgo+ID4gPgo+ID4gPiBBZGQgYSB2ZW5kb3JfaW5pdCBjYWxsYmFjayB0
byBoYW5kbGUgdGhpcyBjbG9jayBzZXR1cC4KPiA+ID4gQWRkIGEgdmVuZG9yX3F1aXJrcyBmaWVs
ZCB0byBkZXNjcmliZSBBTy1zcGVjaWZpYyBiZWhhdmlvci4KPiA+ID4KPiA+ID4gU2lnbmVkLW9m
Zi1ieTogSnVueWkgWmhhbyA8anVueWkuemhhb0BhbWxvZ2ljLmNvbT4KPiA+ID4gLS0tCi4uLgo+
ID4gPiArICAgICBpbnQgKCp2ZW5kb3JfaW5pdCkoc3RydWN0IHN2Y19pM2NfbWFzdGVyICptYXN0
ZXIpOwo+ID4gPiArfTsKPiA+ID4gKwo+ID4KPiA+IHdoeSBuZWVkIG1vdmUgdGhpcyBzdHJ1Y3QK
Pgo+IGJlY2F1c2UgY2FsbGJhY2sgbmVlZCBwYXJhbSBzdHJ1Y3Qgc3ZjX2kzY19tYXN0ZXIgKm1h
c3Rlcu+8jCBhbmQgaWYgbm9077yMCj4gY29tcGlsZSBlcnJvci4gdW5kZWZpbmVkLgoKTW9zdCBs
aWtlbHkgc3ZjX2kzY19tYXN0ZXIgbmVlZCBzYXZlIGEgcG9pbnQgZm9yIGRydmRhdGEgaW4gZnV0
dXJlLgoKWW91IGFkZCBmb3J3YXJkIGRlY2xlYXIgYmVmb3JlIGRydmRhdGEKCnN0cnVjdCBzdmNf
aTNjX2RydmRhdGE7Cgo+Ci4uLgo+ID4gPiArc3RhdGljIGludCBhbWxfYW9faTNjX3RhaWxfY2xv
Y2tzKHN0cnVjdCBzdmNfaTNjX21hc3RlciAqbWFzdGVyLCBzdHJ1Y3QgY2xrICpwYXJlbnQpCj4g
PiA+ICt7Cj4gPiA+ICsgICAgIHN0cnVjdCBkZXZpY2UgKmRldiA9IG1hc3Rlci0+ZGV2Owo+ID4g
PiArICAgICBzdHJ1Y3QgYW1sX2kzY19hb19jbGsgKmFvOwo+ID4gPiArICAgICBzdHJ1Y3QgY2xr
X2luaXRfZGF0YSBpbml0ID0ge307Cj4gPiA+ICsgICAgIGNoYXIgbmFtZVs2NF07Cj4gPiA+ICsg
ICAgIGludCByZXQ7Cj4gPiA+ICsgICAgIHN0cnVjdCBjbGtfYnVsa19kYXRhICpuZXdfY2xrczsK
PiA+ID4gKyAgICAgc3RydWN0IGNsayAqZmNsazsKPiA+Cj4gPiBrZWVwIHJldmlzZSBDaGVtaXN0
cnkgb3JkZXIKPiA+Cj4gd2lsbCBjaGFuZ2Ugb3JkZXLvvJoKPiAJc3RydWN0IGFtbF9pM2NfYW9f
Y2xrICphbzsKPiAJc3RydWN0IGNsayAqZmNsazsKPiAJc3RydWN0IGNsa19idWxrX2RhdGEgKm5l
d19jbGtzOwo+IAlzdHJ1Y3QgZGV2aWNlICpkZXYgPSBtYXN0ZXItPmRldjsKPiAJc3RydWN0IGNs
a19pbml0X2RhdGEgaW5pdCA9IHt9Owo+IAljaGFyIG5hbWVbNjRdOwo+IAlpbnQgcmV0OwoKCmxv
bmdlc3QgaXMgZmlyc3QKCnN0cnVjdCBkZXZpY2UgKmRldiA9IG1hc3Rlci0+ZGV2OwpzdHJ1Y3Qg
Y2xrX2J1bGtfZGF0YSAqbmV3X2Nsa3M7CnN0cnVjdCBjbGtfaW5pdF9kYXRhIGluaXQgPSB7fTsK
c3RydWN0IGFtbF9pM2NfYW9fY2xrICphbzsKc3RydWN0IGNsayAqZmNsazsKY2hhciBuYW1lWzY0
XTsKaW50IHJldDsKCgpGcmFuawoKLS0gCmxpbnV4LWkzYyBtYWlsaW5nIGxpc3QKbGludXgtaTNj
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1pM2MK
