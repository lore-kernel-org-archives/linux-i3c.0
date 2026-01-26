Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38455C88E4A
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Jan 2026 05:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/K/JjR0w8rKcjFTGa2ptSZySDbXC6kmgXOIl0KjljL8=; b=UaQsovIBu2Fx88
	gpae+MblJuZdr6m2YBsC7YN1D2MyCuxNTmgEvytf1/gmcYVCJ9EFo6dhblFroW/I0sQvBnjMVbTfn
	E1+MQpzoHJULAvGUm2yn15InrpeSgI2MgRHjT7nYlj9FY4WG+mGZy7WxqEQjZOOllnTsg9jDy3F5u
	a/9og7H1codKzTkeHD6ZVtk5q3vMleVx1VXbgYkFJ9adIbB8NRmInzWS90f3b1gUJXXutwNnUoxTi
	NLotsBjpMaqkmVSTDBO3caaZnd5sb0ei+pOeppTeEvbwrWmnFpny71tGKJlsz5qyYx365pmIvlGja
	RpG+9qp/oFElfkxyCBWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPm-0000000Bwn1-411I;
	Mon, 26 Jan 2026 05:45:30 +0000
Received: from mail-westusazon11010055.outbound.protection.outlook.com ([52.101.85.55] helo=BYAPR05CU005.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkFPk-0000000BwmF-1o0T
	for linux-i3c@lists.infradead.org;
	Mon, 26 Jan 2026 05:45:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IDV/N+1xM65jLF/HnpD+V9s7sP3HdKDHLfl5AMhxw2varCH76S8pbMjN7uxfcsnbvkSn9UgnPXmqlX8jCYmQVxIRoMmzEoFkBAuxkYcI63UktNK1WP7OXBJHUaxtI4KTHjxYuqPxzi9zJR8TW82ts0dpjDttoKsRLIvj3MpMbgTgK6GjsZUSXK49OkfY67O044tOTOoxPsk7TTEHhdRezbMKBI7dGygAsT4KkV2VDmfFsZTWxrb9bfnFTUqGr6ihDzWa93NC5wPFlYzMScw1SxQ+AGRV2qTo/4I1Vsr0x1ntNefXh/N0F5FCGQRxvfwj+YzzAEXQLB3M5kcdGPgu4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fwmCl6nZk+JfC1lb0p+B0T+SIYC8Zvg9wuQaNXMyVZE=;
 b=eC5rvnz70ZoKBCqnJSI04+bGsxbQWZmURH95vk2mZbdl6zcW+EChJhR9qpZFd0zFLPYV8BBIAAdnLNtnPDFdI5qyKQbie//oqwTWYHRfzwiTZOfbciDOj1H1QysibHQQp5G3OiukdMWUp/+kkNkqVLr/u+CDBSmSFdIiMgrQgA0lR1yMm133XkvNjPlrZSvAw4nhGFXbVzf7fP4UVd3PkldLuZ9DDlbnM+524rX8OL9SMM0eCNmxgDcs6udAPWNR6Ecoih4vMnWEaHzIrl30pam35AXivDCKz8idj0mzRW1zX7+G/L5wm0sHR8B4A6WdO5hErgw1v7b/SlsjQJKbfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwmCl6nZk+JfC1lb0p+B0T+SIYC8Zvg9wuQaNXMyVZE=;
 b=FZhZKIH1W97KrwIQYZR4CRv00/WllF+BnrvhmtXBUDg1RrSdF67+iAk8KFdeUg7Di5UH2/eXn+l81lGolsGv3VhOZrjyBVXY1cy56Www8LbS+9fN11focOdMwNl6AND2h+Zw1mA6RCC/hczDtsR8GKBE15FpqMr/eiQ4z1+OruX6Lw7nwMACrOrIZCuSJarZJ/wlt0Szlj7LAb+GeNF971l2d62btMZ5j2WWpfNppQJsKjWi+hvLnTmHas4J1FCzFq9wx0GUBDmhZ7vQcRxCtPEshpeUAH02pWobE185hVhvHmrNJHyj8Ets+VIam3YolyBdhFPvLx0wKsl+MEACOg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM8PR03MB6230.namprd03.prod.outlook.com (2603:10b6:8:3c::13) by
 LV9PR03MB8415.namprd03.prod.outlook.com (2603:10b6:408:365::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.14; Mon, 26 Jan
 2026 05:45:19 +0000
Received: from DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542]) by DM8PR03MB6230.namprd03.prod.outlook.com
 ([fe80::abad:9d80:7a13:9542%3]) with mapi id 15.20.9542.010; Mon, 26 Jan 2026
 05:45:19 +0000
From: adrianhoyin.ng@altera.com
To: alexandre.belloni@bootlin.com,
	Frank.Li@nxp.com,
	linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: adrianhoyin.ng@altera.com
Subject: [PATCH v3 0/2] i3c: dw-i3c-master: scoped spinlock guards and SIR reject fix
Date: Mon, 26 Jan 2026 13:42:21 +0800
Message-ID: <cover.1769404925.git.adrianhoyin.ng@altera.com>
X-Mailer: git-send-email 2.49.GIT
X-ClientProxiedBy: BY5PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::13) To DM8PR03MB6230.namprd03.prod.outlook.com
 (2603:10b6:8:3c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR03MB6230:EE_|LV9PR03MB8415:EE_
X-MS-Office365-Filtering-Correlation-Id: fb5e5609-36bf-4232-fe03-08de5c9e16ef
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YTAINeTDOEWQ0xYi2CeARdbDyb3LhA/LKprV7Psj9hF6b2Ao/M4RBx5IiaCn?=
 =?us-ascii?Q?xT6PJqp5fXylq2J6/R4x/pFWLvw0Bz3DSnoaAfyBknDPX8lCESmBoeogii/+?=
 =?us-ascii?Q?/PKhrUe0uT9iSbchu37Odi0oZfflfKYjErsIQLVGL6NGhxWM9ioNJHesaJ50?=
 =?us-ascii?Q?CxX5srygmlL0tBZsyyyglV/OP5q/IX37Rq4VV0qzInelKf+mJLj0TPJdbuVU?=
 =?us-ascii?Q?dO0P/YDvqrfuxIrGts9TThvlDY2UrjOQMYv2bOI3aRcf76XGHHuKxm6Q0CFT?=
 =?us-ascii?Q?jWuqfQ/6GiHA0me1xIk424n8oatajvE4LKAhiNnfOdQGUxL6mRKUERpIzNlh?=
 =?us-ascii?Q?7wn+glH/s3dPebyoL+q7TGaYvD6bi2bvx8v99f3Yk0d5/hr1yUAy1TDNHgNk?=
 =?us-ascii?Q?oA6PIqG4SrjxEp8LsaHfh69t7AahW1ChfktzwkQXc4MSxZOqNRtqtdbJ27HE?=
 =?us-ascii?Q?xWdNCueXpdOgiybKHu/4pTIVsnL0FgIH3LVisCdqE+gsbqVAWkWuyBonk/eS?=
 =?us-ascii?Q?nVz4HhBS9BFQg/GP0E56zF8bnLCfU5eaKnAJF1SzVWWJ2wOKmdLdKnNfcHLp?=
 =?us-ascii?Q?4X5LxUuouZ7ckrwSMMHZYP3pHSMeAUmdgiKOdE9Dq7uPYVmNn4HsKcGJehzp?=
 =?us-ascii?Q?//hvCh3i/9ufYBAXk5DonFlgesYGamKEGZulJWSBGyLcHFGSWCboy/AqOjy7?=
 =?us-ascii?Q?cTCiI5cmruF7THxF/2jC62eSQJ4zYrQcg93kinYc38+q2P9fQ2E7W9Fgm+RW?=
 =?us-ascii?Q?QtW7DU7wSdH6ckfCF+pWCxPwTOEULQmdf/9fiWJpZEihIw/m8Tgd6TtriUuI?=
 =?us-ascii?Q?pEX0NUW3fH8hQQ1KiKQNbiLa9q3mduaK6tGjhtA1UKih8jnxe1ScGrL1aKX2?=
 =?us-ascii?Q?FveA8XljpS5FQVXsuGNnn2mD+usAHVP3TuR7iy+SV7UTJCMAexYvDIMpLeGi?=
 =?us-ascii?Q?e3CjqwT7URVjGw8j2O2BmQKWxMNaLsslLnBp++IXPd9QZvRzI2tCRblb0YU1?=
 =?us-ascii?Q?sR8j9OzMmcbVfUipFnj7CavIBqmVUURWa/bOIbahVjl4Iyk4KQxFmyWFHLwp?=
 =?us-ascii?Q?+87Avs4PtzL2JPpx4zHsqhQT/HdxXh/mi2xVAFemcp6sKyNRLUPKQbIrHZVT?=
 =?us-ascii?Q?OKGLKdXtfB6SSjQVoqFKlS9JbIUmbpvKA+eE54weN1mDf0TA+WDYWzPOVxxh?=
 =?us-ascii?Q?IVQEPjoKopqaNPZ9mIFZtat1uUg4Nv8k0yh4dlTasSVkuMTC6xc6gHBXuexH?=
 =?us-ascii?Q?FQfm0EjzdxjHumU5vZ/wKo9e4WSXZUC1V0JN9PiPQoMx8dAYWoGTj+PFD+m1?=
 =?us-ascii?Q?d//KhI38CbLMxrblUuu1I5gHqr0ISqc/whfLHDvrBrNHA4PBKV988eWzbJvt?=
 =?us-ascii?Q?wVNs7pGATruDYXWlutRfNVrVyUkpxeR+1e9Jeu7kxp4mjXZErady0+uKgLQ2?=
 =?us-ascii?Q?NaBUxD+JdpoQ60p3UnWqWOSpI46TCQqqnnCd4+7lvewxz94LC5UirpgEfX2e?=
 =?us-ascii?Q?TJUYg6op9WslezlaPJJLeO69TI7Pwi1nOH9+1zm/OsnZsZMqYJxfUcw9EQhW?=
 =?us-ascii?Q?GWX2TdSBn4l144onBXM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR03MB6230.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9mvDzAKQingbTgVFyo3YaZoUx8ICI1ihYSCwU06+u32RZuxlcSHqdRwdi8mC?=
 =?us-ascii?Q?9pPFZVZHR5tAm3lOGA18G4nhJDKONABwWHTZm/9yzDpixOZtLMqZdu2Kj5IC?=
 =?us-ascii?Q?LSuLkwsJB2zXpyXDbf9sABLVqS6hclLHHnQ0D6cGRdOExweBAlHIPQlvB50s?=
 =?us-ascii?Q?583yI8/COT57jinBE3s4da+0cHUD4kwxmsDT7s6vkkoQ7mcHGFtrObzTnA76?=
 =?us-ascii?Q?dmCd1uzXi8bn5v+O35EkiJFZCDIrTAEwOuBaQsuJKxCA5m1uFGwV7O2UZw25?=
 =?us-ascii?Q?nvKtSMQoQKKIgtAlgq+uEaQqeIRvf367K/LWjhrM98ySwHdx5RxaoB8rOOlZ?=
 =?us-ascii?Q?i9esw1/hCRbjmPz17df13l4YFMA/2yoTMCA6lynVqPkRaC3gLu9ofBLg4po+?=
 =?us-ascii?Q?x7pbtjburWNFRx6Kh5kgL3LTiQ4Il36tTzM4lI1YSybvbk+tR7H48u/WeAu5?=
 =?us-ascii?Q?TCyPyXp6FHoFceXX9OreERe3at1TwQIz9/BoYHEFaqlt+HbqQ78BBb6E4nst?=
 =?us-ascii?Q?k8hocfHmTKWlUrIj4CW0ymp+m6HJJoyHoUQQYD6SSS5LXhg/i7o/MUQT+2mT?=
 =?us-ascii?Q?EVpEANZddToAiiZXm14X4sXEIOEfgmhlfOnKjbH1EGJXkEdVZLrhzCqzjgXx?=
 =?us-ascii?Q?65r3wa1xHrjfm7PtL6Y6Dg6XcMdSCixEgYr50XiVuoWKCzacgjZsbgZLh5Cy?=
 =?us-ascii?Q?iZzNLHM+zRlGbxrX1/iI7rXhrhS/Ri6hZr7Oyl9X4mIu257W4sln0WiaeNJ7?=
 =?us-ascii?Q?G5S0YeaeAulRR9oPoi2pb6v1sGaRGGKTKhHfxZQfFMD3uwdtko+McIaC5ncw?=
 =?us-ascii?Q?aVVITrLnesY9WjK/Ftpcj7X3jt1HiCvVMuzHYO7RwefuDWwuI9X+FR+Pws/l?=
 =?us-ascii?Q?FrmDKrCf1Pb9baIVAI7mEG3Ih7A5uG+wjgxWsjmAEL8VXChQZPaTz6ZS0bSr?=
 =?us-ascii?Q?keqwUF7AJvkkNHcvml1UXE9Q4eUMlhiGiypurbL+FsAB+ImlZGLKhJKw3q+7?=
 =?us-ascii?Q?GTQMfHdh4c+Qthw8R258fUMvxOV9aPt+e1tUm8QbFc74KUPRZQDpg7XeY0X3?=
 =?us-ascii?Q?pu/pTcj460CWWcOyRGuT48AT/GFci62eTziCaqtdIXR2soJpq1Zb1CWJ7kSo?=
 =?us-ascii?Q?24ruPuW/p/AbmrxcDxiz878mYCCUfzCo7L6G+Q1YGXDoINSNafNkoEzxQKro?=
 =?us-ascii?Q?3zj8v1oa3uXZn/jd+wi5/Xffy5d3cCl49SMhwoos1aKFKehly0A7304fEmUg?=
 =?us-ascii?Q?8tCJjfkIwDRDPUA7F5lprnl1ENGCfXDR8QdCcy7c8cgC9fC93AIz1yFQqMca?=
 =?us-ascii?Q?ic8bly3/TPAQ0GWAlCuArSTkOKvXK81qB3jaDdPm1AtlPq/LDuO5pErmOZUv?=
 =?us-ascii?Q?HsLLkWsk0UKcUs9aMyC16batUwPh4bi66tv1ZKqeixdHOp4fVlDbuo2uKVqs?=
 =?us-ascii?Q?0MsguFOhtKYJCj3GML+a0TTHDASJnSMX0HBcu5hAJSNtiIGT/bkJtqq8iaFO?=
 =?us-ascii?Q?9qLlxlNhf4GkoGYq9PorRS4eki9yiWTkdach/ND2MPhWQId4gzThgqVQEzjp?=
 =?us-ascii?Q?EDE4S/PbAHTOYv4mlKHYBEeYYXxZ+ORSEcfDaEndysyf4fYHRB1ZR9oVRz3n?=
 =?us-ascii?Q?0zs6aFAjaxZedDCNbt7J20dxMustjdyx/E+U3B3mT92mY43qsnamkkwr/67F?=
 =?us-ascii?Q?P/TKi5c3aukY3utVhKFguDEyKKtSFk8v1qmPWzCNlTTN3u7SgNz4EtNaLBKd?=
 =?us-ascii?Q?mWDO32uG6+j+QPBT+NwLgDLavxrJ710=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb5e5609-36bf-4232-fe03-08de5c9e16ef
X-MS-Exchange-CrossTenant-AuthSource: DM8PR03MB6230.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2026 05:45:19.5861
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sq6+9mHLOqXrQLSVOqLRexYZTMB/50WBdv55aL4KldCJ3zrePk8bjO6iRuCRNmhGpFLRRxsIG6qmSSZJ8FzpPnCjz4Q89I0dYYyMwfeRSko=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR03MB8415
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260125_214528_511948_4BD2470F 
X-CRM114-Status: UNSURE (   8.39  )
X-CRM114-Notice: Please train this message.
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

From: Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>

This patchset replaces open-coded spin_lock_irqsave()/spin_unlock_irqrestore()
pairs with scoped spinlock guards to reduce boilerplate and ensure correct
lock release on scope exit.

In a subsequent patch it fixes the SIR reject bit mapping used for IBI
handling. The IBI_SIR_REQ_REJECT register is indexed by a folded form of
the 7-bit dynamic address, but the driver currently uses the device table
index. This can result in IBIs being rejected or accepted for the wrong
device. The patch derives the bit index directly from the dynamic address
as defined by the controller.

---
changelog
v2->v3:
- Update guard function call in dw_i3c_master_free_ibi to use scoped_guard to avoid
  i3c_generic_ibi_free_pool happening under spinlock.
- Update get_ibi_sir_bit_index to use FIELD_GET and drop DYN_ADDR_LO_BITS definition.

v1->v2:
- Add implementation to use scoped spinlock guards to ensure correct lock release.
- Update remove DYN_ADDR_HI_BITS macro definition and update MASK to use index directly.
---

Adrian Ng Ho Yin (2):
  i3c: dw-i3c-master: convert spinlock usage to scoped guards
  i3c: dw-i3c-master: fix SIR reject bit mapping for dynamic addresses

 drivers/i3c/master/dw-i3c-master.c | 60 ++++++++++++++++--------------
 1 file changed, 32 insertions(+), 28 deletions(-)

-- 
2.49.GIT


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
