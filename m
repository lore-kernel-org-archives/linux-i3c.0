Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3C2CAC582
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Sep 2025 14:31:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6El2dQBYZj0Ncvmq47RstHLi/PgTQHZ3D3ounJbt4Ag=; b=PvpTEMpVKs1VQ4
	qfCxdeC38UkDRUC//ZB1hh0o/tJSDDAwwytDvXKW6QbNy30ygaFQprdrjWnyaLDczUfiE1LfzyQY1
	PQjzXlpo1Bw5HJS/xgiuAJqMpI1cnZpP071PKU7qFEwysE0KOYKlhknTkj7AA4SdbnrhNecVTOvER
	10FigDUAm12u3Y1FqKIS55/2ldR5Kfx+P/SGNC1KwH1rQbVK7J6S/BhvKEJeeUgNMLmtgkyZF37Gh
	SfZNEy/yznw4kc1abFApBVCCr5ICT6TZwr+NnXwnFer8Jpe5LKOUo37pDXWBPrcqUkcUtmv/wEUDd
	wF8IPBXaULVQV/W+KZDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4oX-00000009uqn-0DNS;
	Fri, 12 Sep 2025 14:31:49 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux4oU-00000009une-0ru9
	for linux-i3c@lists.infradead.org;
	Fri, 12 Sep 2025 14:31:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b1f/tgF/DFKkBjUX9ggmmW98vC3ODN6j6Sj2uqnZ5LDCNn2IJQ/r7kWc127OTgbgs7jlOvWUJeaRvVtMJOi/6X+6KLfjeE3Dein0s7RvueEFPiquZz7lBeZreiKDoT8SXdLqhlEUHgSEZZgt28oGYvXfCCIN4hZ3apuq9q9OISKg1x5VH0blcINBKA5TLQaTU+hcqMNFX2LvuJNIVqIHfaD6DFijjrUBAL0+p4I3BzR8v7DayFsQI/Una8DNmxM7jbgTTLjG3Y/lLEFc7S5U+f19OfnKeocJcKwYcRiYDvk7eHsiykz5PL8Vm4fH7+qC5hZ8UaQWMQEfVAoXmyLrAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X7B+jd39RK1+8c/ZXXFktvAT6Skc8Z++54bGbHaovwM=;
 b=TfjYWvFhzH5UmHMR54bvJm/K9pWDP91IYDrUCYHX6S4LEMVbsZ3ydX7Ger5EF1T7UhfnCC6hAlWImZmaSZNUs7FZNAY3DV+jXv1EYAdXXOt0651+el1iTxaF8EPty96qTwVQQ0qMASc7icO020Nb77opOoOZk/62KkhfaQHGT6o9JwGD9wOVhAxubfeOiA2dHevcBI0VVO0iYvfYwMhDzhru39fbThtDm2XVknRAANb/o8Ll5B0P4etSbYYN3LjUxuS29A1htKBkcjYHKdMwK7g3lOR3O/agvySDmY2x12bROa2ttwVEj8ofJJfUdjxclP1q6ACiP+zmiMpZUDjDHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X7B+jd39RK1+8c/ZXXFktvAT6Skc8Z++54bGbHaovwM=;
 b=O27Rg0LHmhrwnASjxzi2PWnn+HgSt0vuaszyGymMkbDlWLBvENcX2TNQLf1RFcmxZmRE+KLKN5UcjjllQrKnSxo1RULXHIaFGtAOto6F8bd4AarB/IuNoHkGi/wYd6UGCTMlXPg7t8PHMOE65JW+e4D4pS8YB/DtCxkaB5hR/7pPi2fsm7sKqDQSMhzgLsKuSglwz5lxl+6FF3Q8usoP8qPlCEMNuTzrmw6IjcysK+voWjc3cBZT4te/z1nn5DKkb3dyrxzqyQTJC6ZzfCiRJWEa9YAOlC0RoTalnyzYuuwt7GYtYRQ292kKeCoF12KSp3yIuS2VdDRqaUpiOjFmPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com (2603:10a6:102:23f::21)
 by DUZPR04MB10037.eurprd04.prod.outlook.com (2603:10a6:10:4d8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.14; Fri, 12 Sep
 2025 14:31:41 +0000
Received: from PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15]) by PAXSPRMB0053.eurprd04.prod.outlook.com
 ([fe80::504f:2a06:4579:5f15%6]) with mapi id 15.20.9115.015; Fri, 12 Sep 2025
 14:31:40 +0000
Date: Fri, 12 Sep 2025 10:31:33 -0400
From: Frank Li <Frank.li@nxp.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: linux-i3c@lists.infradead.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH 5/5] i3c: mipi-i3c-hci: Convert remaining DBG() prints to
 dev_dbg()
Message-ID: <aMQuxQ2Rk8ILUl5i@lizhi-Precision-Tower-5810>
References: <20250827103009.243771-1-jarkko.nikula@linux.intel.com>
 <20250827103009.243771-6-jarkko.nikula@linux.intel.com>
Content-Disposition: inline
In-Reply-To: <20250827103009.243771-6-jarkko.nikula@linux.intel.com>
X-ClientProxiedBy: SJ0PR13CA0028.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::33) To PAXSPRMB0053.eurprd04.prod.outlook.com
 (2603:10a6:102:23f::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXSPRMB0053:EE_|DUZPR04MB10037:EE_
X-MS-Office365-Filtering-Correlation-Id: d286e14a-c97e-409e-c2d5-08ddf20916ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|52116014|19092799006|376014|366016|1800799024|7053199007|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lN82LrGOWzdZ3soOwN3zZq7tZDibnS24DbCm0G+iw63ArZXi/JRdQoUA6VW4?=
 =?us-ascii?Q?lPZIr/lXuwOFZvHCJSImdhsmprwKEqZQAU4Jw92JTuhWa4VBNEeQaVxSQTgC?=
 =?us-ascii?Q?hysckhX4oQ24TatViJwzGUygkudmD/0jGJF5FfyaUmFO4jZ09R95Q/NyiSt2?=
 =?us-ascii?Q?eEml2MZQ0tyqbe5qJw0fdeTb77x0XXB7y4Tz+dH01/GBkODPBIBctthJpPhM?=
 =?us-ascii?Q?tW61dO9QlG0wbbemAXEhfy1/Tcm7CQ0S5N/8lNrmq2wr7oFVhnjxVdaEP9Zz?=
 =?us-ascii?Q?aeP7gQrEre+J0YZV8XvyMDDWMCNRrnqbCFK4yd2gN/Jo6s9k4aa3425j6Q2c?=
 =?us-ascii?Q?UtmsFrSzJptItJmWSConfBL0p0rDDKjo3gzVp/eJ3eTtH5QrH3smUTx5uV62?=
 =?us-ascii?Q?8WxoQaC/Kir62M+Kum33MQPTxDNDidS9zszRbfirAFAjASlT/E0tHpEM1nXx?=
 =?us-ascii?Q?kxJIZ+8jXNdjcveKU1mgK9ynfJ0ftndFoDqRQ8OJnRrNLfQ06XzrocZr3Iio?=
 =?us-ascii?Q?t6TWETDrWuPbznu6mSN6UBhzqaDK9x15bt76RWSMfVK9XPZvKtjWjBEOx2Bw?=
 =?us-ascii?Q?4/eqrsWXh/zC4MIaSZ4BUMOPdQ8DisaaoaEZnUpTmFLhSEhrpEvCOUj+SmGO?=
 =?us-ascii?Q?UUDXDaJP3xtWMK4yIKuvjgDzcYFafReeop/uMOUDeG9afht1DOfXBW4tGWWL?=
 =?us-ascii?Q?ZmL47L8CFDzwr9niA5t2njlHUxRFENhbvpS1erzoFc3+9V+M3bHZMYEpnpEr?=
 =?us-ascii?Q?+rjHY3AXFBdsfBBkQi7f7jgNxylTKlch1J/N3l/cobxavC0Te6ChLePG7MKG?=
 =?us-ascii?Q?62GsbxCdESWmQhhEU/FK8K9tE/ODa0Ju7pTD0MEPOTTeFrsUGt4JDJjFjcrf?=
 =?us-ascii?Q?KnTDhHUDK3MvvYg13xWhZlO+zxD5V2mkZv2B4lDF8xOOC2Uz6/RDcKaNBieu?=
 =?us-ascii?Q?KOTbgoa3Kkm5rml3GlVlYs16kqk2F/LEmYyDySho2bWk8RQFpWepqnyZfwDl?=
 =?us-ascii?Q?mfe9GBC8mz9n68SJzYrb53RapJG66BVUFBRE+tGVpDpLL49FWidBcp49Mdk8?=
 =?us-ascii?Q?JOlciHkj5o5nShoglAIGDvd4DMBaX4+8LOwrmAUinF/FZVYSlkbrsku1z4cS?=
 =?us-ascii?Q?53mTW2rNZa1FAoubfrttSfJUNqiYIhJuvEqQAT6ynL7ZD61DMSYeiNQ/Gl7v?=
 =?us-ascii?Q?pVzNhwc2cUSGfPuTGs2iCu7J6ifnvEc0jO/5Wskb/Y5p00WrdFzzlAZY5xE0?=
 =?us-ascii?Q?9aVnZeeQScep+EeSjBVT23EQvcn/7nIhRhBRZ5w2eJZXLY27LoVwW8WGciRf?=
 =?us-ascii?Q?6hOffggTvV8rSevTIeyVKoeXKeyuCyCD3yFNquxPy3zX+zxCrjRc59RDcV4B?=
 =?us-ascii?Q?mnZqx2Gr/jrO8W57tzzNYtCizQBqyMl5EUm3xLdvVwrTlwI1hdXpOEEj8Xjz?=
 =?us-ascii?Q?19IX3NMEpSj2HD7tZ9gBZeGSy/w0sUdAYA6N/bQoGCrEIyhEsiVAh1VJ+s1c?=
 =?us-ascii?Q?4sJmkb2+VGPTSwk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXSPRMB0053.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(376014)(366016)(1800799024)(7053199007)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HApLURHC7g+dJ4s6DkHENVSM/T4s8gGkf7h41Gb8Sv8+QM8fZHX3DQ3dhdF2?=
 =?us-ascii?Q?T6CC7v67UkaeLBX8gJDPZ8PcEdHXRsQ0FvQHLkVC24FOTe9dsm0Y+b+kQoAb?=
 =?us-ascii?Q?FclHU3P3I9cZ6KF7tpPIB4GYZPARpbc2EsiD+7x+Qw13XBzaVL7g233S6CGk?=
 =?us-ascii?Q?bEQLHZ8T5SMlOb31OxNuKoPp3bRZ6FMdpIUGHH3TqkEl15dYWde9wBj1THAO?=
 =?us-ascii?Q?wVM/KvfV0WXmGs6igcDwX0fHjDUBe7qlEvtKxLw3yDXjYyOqlAPOoMQVsGFt?=
 =?us-ascii?Q?iifvQUNPvHOB7H22yowSmT3N9SdfX8lJRuRgM5C3orzWEgJ43tPoUHRiCQQM?=
 =?us-ascii?Q?lMThg6RRkG/9xuttoEBGU6HW6IYu0oXgot0qrPNwmcefiTroR3UwXQfO9Tiw?=
 =?us-ascii?Q?Nief+qIt16rVfwefIl3VnthmRbQ4M8lrhia4+Qsl5pCay6IUW9kZcGN5L3Oe?=
 =?us-ascii?Q?1sYq6wWfLCbWfkpx7UieSc4cI3J0vHjSibQWU/Q0q8Sidb03zkSkm3B9Rl25?=
 =?us-ascii?Q?t/Tvz+iod/LPWDo82cBsldfpdHFicf2Q6IYwA+3Pc+/IL1AHAOXamPMmGMsO?=
 =?us-ascii?Q?a+cECeGal1Re/6DWGSEBUHNixa9PitCvsvfd1mfvwEdA8cQOQLVwfYB0q43v?=
 =?us-ascii?Q?NQRkTT42RBmbsErc/uULMgrUIyTUFtdKoiu+qgkNg+pOuOWALbayhbUhWfUa?=
 =?us-ascii?Q?6pL450KDvqdy1wVV35fgrkXMqLSWJn37YT84Bh4++HulpTWBeY9x+4VpWmbt?=
 =?us-ascii?Q?gKacb1/EP1MJeygnbQNbcw/jNwf8GswadOdZ04D1pPE0Ilpsv32SO06OYQ91?=
 =?us-ascii?Q?yjFMJoPoSkrWBTl6sRmQYM+gkDdfCcmmBYUgftKJHA3ZhaB0IkLLgDC33Yfr?=
 =?us-ascii?Q?u5vPIfzsg4hWGd418miCr5QYJVS+Zb8ikPxmhQ0QLBgCzFQL4uyn6cm9IuSt?=
 =?us-ascii?Q?9CYNc1kmxkZWg+1lkJfevFkbO/jZ3YoWJA5efJYYXLAobD+9e/Ac55XWW5Ah?=
 =?us-ascii?Q?B4e5FUwZfPd77bm9HJ240q09c0TLfwCXndfdIplvb4OOvhKWpt9YGwFNUHab?=
 =?us-ascii?Q?F/rqDLVvR1uJV8gFnwOS9ckL/C5S9QwMvUFZqY0q5mV3yR5kXZTlEK59RT/K?=
 =?us-ascii?Q?O0i1BUql1f3afZW+DrdYSBXiCdDB6YlEp4rcdyiyieYNSXPnblPPSez9XalN?=
 =?us-ascii?Q?8LEdt9PxSo56NoQC/cHyo8o0WBe7/kHa16tBD71Kf7KcEP0QJvS9GWvQQhZN?=
 =?us-ascii?Q?qzeAMV76wwUE7GCveCM7/CHx3PF4IF7SqWXKwKJ1GIui64/XfqaflMP0jfLr?=
 =?us-ascii?Q?NQwvUAnzpJByfGKgI1N8i94m5aqk6KDXILIqNZSpEWbFFRdXBsMmwwwfE304?=
 =?us-ascii?Q?dn5EXSDlKKAGSRnqPwjh/3FWYvqAYpvv843cC79sYZQsntPvp7nEvATu03lC?=
 =?us-ascii?Q?chDk1Zdu5gKw5uwj+ifq6rIzzTSG0ViMEcWgixkaiHlvg1eqPkZaw7Quq6dz?=
 =?us-ascii?Q?vGtkiXxStWF7d0krI094LVBAoarA/7+ZddI11scCIey9EvOr/3ys0FMNx1Uh?=
 =?us-ascii?Q?lxPbP5ik4sYMJ3AsYsZDgd2B5BJrWTmLbicX1gl9?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d286e14a-c97e-409e-c2d5-08ddf20916ba
X-MS-Exchange-CrossTenant-AuthSource: PAXSPRMB0053.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:31:40.8541
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ej/qdKer5q+uTWm5rt9ORGZukevBCMgZ9wv+6XzHem4EoqB8Wwk7wI49r/9sB6qbQUy3eu1cQ2kwTaL/BraKXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10037
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_073146_424251_B8AC7A19 
X-CRM114-Status: GOOD (  21.42  )
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

On Wed, Aug 27, 2025 at 01:30:09PM +0300, Jarkko Nikula wrote:
> Get rid of local DBG() macro and convert remaining debug prints to
> dev_dbg() which can be controlled without code recompile when kernel is
> built with dynamic debug support.
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
>  drivers/i3c/master/mipi-i3c-hci/cmd_v1.c   |  9 ++-
>  drivers/i3c/master/mipi-i3c-hci/cmd_v2.c   |  7 ++-
>  drivers/i3c/master/mipi-i3c-hci/core.c     | 16 +++---
>  drivers/i3c/master/mipi-i3c-hci/dma.c      | 15 +++--
>  drivers/i3c/master/mipi-i3c-hci/ext_caps.c | 11 ++--
>  drivers/i3c/master/mipi-i3c-hci/hci.h      |  3 -
>  drivers/i3c/master/mipi-i3c-hci/pio.c      | 66 +++++++++++++---------
>  7 files changed, 72 insertions(+), 55 deletions(-)
...
> -#define DBG(x, ...) pr_devel("%s: " x "\n", __func__, ##__VA_ARGS__)
> -
>  /* 32-bit word aware bit and mask macros */
>  #define W0_MASK(h, l)  GENMASK((h) - 0,  (l) - 0)
>  #define W1_MASK(h, l)  GENMASK((h) - 32, (l) - 32)
> diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
> index cde883137bc7..01e7d2833301 100644
> --- a/drivers/i3c/master/mipi-i3c-hci/pio.c
> +++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
> @@ -213,7 +213,7 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>  	pio_reg_write(INTR_SIGNAL_ENABLE, 0x0);
>
>  	if (pio) {
> -		DBG("status = %#x/%#x",
> +		dev_dbg(&hci->master.dev, "status = %#x/%#x",
>  		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));

fix pio_reg_read() align to (

Frank
>  		BUG_ON(pio->curr_xfer);
>  		BUG_ON(pio->curr_rx);
> @@ -226,13 +226,17 @@ static void hci_pio_cleanup(struct i3c_hci *hci)
>
>  static void hci_pio_write_cmd(struct i3c_hci *hci, struct hci_xfer *xfer)
>  {
> -	DBG("cmd_desc[%d] = 0x%08x", 0, xfer->cmd_desc[0]);
> -	DBG("cmd_desc[%d] = 0x%08x", 1, xfer->cmd_desc[1]);
> +	dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
> +		0, xfer->cmd_desc[0]);
> +	dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
> +		1, xfer->cmd_desc[1]);
>  	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[0]);
>  	pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[1]);
>  	if (hci->cmd == &mipi_i3c_hci_cmd_v2) {
> -		DBG("cmd_desc[%d] = 0x%08x", 2, xfer->cmd_desc[2]);
> -		DBG("cmd_desc[%d] = 0x%08x", 3, xfer->cmd_desc[3]);
> +		dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
> +			2, xfer->cmd_desc[2]);
> +		dev_dbg(&hci->master.dev, "cmd_desc[%d] = 0x%08x",
> +			3, xfer->cmd_desc[3]);
>  		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[2]);
>  		pio_reg_write(COMMAND_QUEUE_PORT, xfer->cmd_desc[3]);
>  	}
> @@ -254,7 +258,8 @@ static bool hci_pio_do_rx(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		nr_words = min(xfer->data_left / 4, pio->rx_thresh_size);
>  		/* extract data from FIFO */
>  		xfer->data_left -= nr_words * 4;
> -		DBG("now %d left %d", nr_words * 4, xfer->data_left);
> +		dev_dbg(&hci->master.dev, "now %d left %d",
> +			nr_words * 4, xfer->data_left);
>  		while (nr_words--)
>  			*p++ = pio_reg_read(XFER_DATA_PORT);
>  	}
> @@ -269,7 +274,7 @@ static void hci_pio_do_trailing_rx(struct i3c_hci *hci,
>  	struct hci_xfer *xfer = pio->curr_rx;
>  	u32 *p;
>
> -	DBG("%d remaining", count);
> +	dev_dbg(&hci->master.dev, "%d remaining", count);
>
>  	p = xfer->data;
>  	p += (xfer->data_len - xfer->data_left) / 4;
> @@ -278,7 +283,8 @@ static void hci_pio_do_trailing_rx(struct i3c_hci *hci,
>  		unsigned int nr_words = count / 4;
>  		/* extract data from FIFO */
>  		xfer->data_left -= nr_words * 4;
> -		DBG("now %d left %d", nr_words * 4, xfer->data_left);
> +		dev_dbg(&hci->master.dev, "now %d left %d",
> +			nr_words * 4, xfer->data_left);
>  		while (nr_words--)
>  			*p++ = pio_reg_read(XFER_DATA_PORT);
>  	}
> @@ -321,7 +327,8 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		nr_words = min(xfer->data_left / 4, pio->tx_thresh_size);
>  		/* push data into the FIFO */
>  		xfer->data_left -= nr_words * 4;
> -		DBG("now %d left %d", nr_words * 4, xfer->data_left);
> +		dev_dbg(&hci->master.dev, "now %d left %d",
> +			nr_words * 4, xfer->data_left);
>  		while (nr_words--)
>  			pio_reg_write(XFER_DATA_PORT, *p++);
>  	}
> @@ -336,7 +343,7 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		 */
>  		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
>  			return false;
> -		DBG("trailing %d", xfer->data_left);
> +		dev_dbg(&hci->master.dev, "trailing %d", xfer->data_left);
>  		pio_reg_write(XFER_DATA_PORT, *p);
>  		xfer->data_left = 0;
>  	}
> @@ -481,7 +488,7 @@ static bool hci_pio_process_resp(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		u32 resp = pio_reg_read(RESPONSE_QUEUE_PORT);
>  		unsigned int tid = RESP_TID(resp);
>
> -		DBG("resp = 0x%08x", resp);
> +		dev_dbg(&hci->master.dev, "resp = 0x%08x", resp);
>  		if (tid != xfer->cmd_tid) {
>  			dev_err(&hci->master.dev,
>  				"response tid=%d when expecting %d\n",
> @@ -522,14 +529,15 @@ static bool hci_pio_process_resp(struct i3c_hci *hci, struct hci_pio_data *pio)
>  		 * still exists.
>  		 */
>  		if (pio->curr_rx == xfer) {
> -			DBG("short RX ?");
> +			dev_dbg(&hci->master.dev, "short RX ?");
>  			pio->curr_rx = pio->curr_rx->next_data;
>  		} else if (pio->curr_tx == xfer) {
> -			DBG("short TX ?");
> +			dev_dbg(&hci->master.dev, "short TX ?");
>  			pio->curr_tx = pio->curr_tx->next_data;
>  		} else if (xfer->data_left) {
> -			DBG("PIO xfer count = %d after response",
> -			    xfer->data_left);
> +			dev_dbg(&hci->master.dev,
> +				"PIO xfer count = %d after response",
> +				xfer->data_left);
>  		}
>
>  		pio->curr_resp = xfer->next_resp;
> @@ -591,7 +599,7 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  	struct hci_xfer *prev_queue_tail;
>  	int i;
>
> -	DBG("n = %d", n);
> +	dev_dbg(&hci->master.dev, "n = %d", n);
>
>  	/* link xfer instances together and initialize data count */
>  	for (i = 0; i < n; i++) {
> @@ -611,8 +619,9 @@ static int hci_pio_queue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int n)
>  		if (!hci_pio_process_cmd(hci, pio))
>  			pio->enabled_irqs |= STAT_CMD_QUEUE_READY;
>  		pio_reg_write(INTR_SIGNAL_ENABLE, pio->enabled_irqs);
> -		DBG("status = %#x/%#x",
> -		    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> +		dev_dbg(&hci->master.dev, "status = %#x/%#x",
> +			pio_reg_read(INTR_STATUS),
> +			pio_reg_read(INTR_SIGNAL_ENABLE));
>  	}
>  	spin_unlock_irq(&pio->lock);
>  	return 0;
> @@ -686,10 +695,10 @@ static bool hci_pio_dequeue_xfer(struct i3c_hci *hci, struct hci_xfer *xfer, int
>  	int ret;
>
>  	spin_lock_irq(&pio->lock);
> -	DBG("n=%d status=%#x/%#x", n,
> -	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> -	DBG("main_status = %#x/%#x",
> -	    readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
> +	dev_dbg(&hci->master.dev, "n=%d status=%#x/%#x", n,
> +		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> +	dev_dbg(&hci->master.dev, "main_status = %#x/%#x",
> +		readl(hci->base_regs + 0x20), readl(hci->base_regs + 0x28));
>
>  	ret = hci_pio_dequeue_xfer_common(hci, pio, xfer, n);
>  	spin_unlock_irq(&pio->lock);
> @@ -733,8 +742,8 @@ static void hci_pio_err(struct i3c_hci *hci, struct hci_pio_data *pio,
>  	mipi_i3c_hci_pio_reset(hci);
>  	mipi_i3c_hci_resume(hci);
>
> -	DBG("status=%#x/%#x",
> -	    pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
> +	dev_dbg(&hci->master.dev, "status=%#x/%#x",
> +		pio_reg_read(INTR_STATUS), pio_reg_read(INTR_SIGNAL_ENABLE));
>  }
>
>  static void hci_pio_set_ibi_thresh(struct i3c_hci *hci,
> @@ -749,7 +758,7 @@ static void hci_pio_set_ibi_thresh(struct i3c_hci *hci,
>  	if (regval != pio->reg_queue_thresh) {
>  		pio_reg_write(QUEUE_THLD_CTRL, regval);
>  		pio->reg_queue_thresh = regval;
> -		DBG("%d", thresh_val);
> +		dev_dbg(&hci->master.dev, "%d", thresh_val);
>  	}
>  }
>
> @@ -773,7 +782,8 @@ static bool hci_pio_get_ibi_segment(struct i3c_hci *hci,
>  		/* extract the data from the IBI port */
>  		nr_words = thresh_val;
>  		ibi->seg_cnt -= nr_words * 4;
> -		DBG("now %d left %d", nr_words * 4, ibi->seg_cnt);
> +		dev_dbg(&hci->master.dev, "now %d left %d",
> +			nr_words * 4, ibi->seg_cnt);
>  		while (nr_words--)
>  			*p++ = pio_reg_read(IBI_PORT);
>  	}
> @@ -791,7 +801,7 @@ static bool hci_pio_get_ibi_segment(struct i3c_hci *hci,
>  		hci_pio_set_ibi_thresh(hci, pio, 1);
>  		if (!(pio_reg_read(INTR_STATUS) & STAT_IBI_STATUS_THLD))
>  			return false;
> -		DBG("trailing %d", ibi->seg_cnt);
> +		dev_dbg(&hci->master.dev, "trailing %d", ibi->seg_cnt);
>  		data = pio_reg_read(IBI_PORT);
>  		data = (__force u32) cpu_to_le32(data);
>  		while (ibi->seg_cnt--) {
> @@ -820,7 +830,7 @@ static bool hci_pio_prep_new_ibi(struct i3c_hci *hci, struct hci_pio_data *pio)
>  	 */
>
>  	ibi_status = pio_reg_read(IBI_PORT);
> -	DBG("status = %#x", ibi_status);
> +	dev_dbg(&hci->master.dev, "status = %#x", ibi_status);
>  	ibi->addr = FIELD_GET(IBI_TARGET_ADDR, ibi_status);
>  	if (ibi_status & IBI_ERROR) {
>  		dev_err(&hci->master.dev, "IBI error from %#x\n", ibi->addr);
> --
> 2.47.2
>
>
> --
> linux-i3c mailing list
> linux-i3c@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-i3c

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
