Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75DEED46624
	for <linux-i3c@archiver.kernel.org>; Thu, 15 Jan 2026 21:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tHYE46mKMDBRnmlOPqFdQAwffAPlmZybgY/6wyeMmdg=; b=LLAcRZW9KOsnUi
	amV6DHhFA+Vhn1kunXsD/81pCoXTpR52iJsKqdQRKP7XjFYiIOG8EmGx3eFDDufTnERLSNxQvrQrr
	6G9E0bHJhwrR+mUp8Ns6Af6l7cujx2R+sMRFjfPAdPpvbjn9msijh20i5R0SMpRlZqtZsc0jFNTMI
	WNSQOx0DGkehkD//M+B8iWhRfwa8o5OrRhVPRfD6k//6FZ/eLjcNvOqbndujW9mWXrOw5webKlQQo
	58aUlx5tMtSmw/EzXt2F11OQ6GNOkbTuNRHResODEkNUJjShqrLi4xdwfF3trmUfNNuxRZa0RszP1
	FX4heDKTOzhpGA3Z5N1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUgA-0000000DDDT-0PWu;
	Thu, 15 Jan 2026 21:14:54 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgUg7-0000000DDD6-3hai
	for linux-i3c@lists.infradead.org;
	Thu, 15 Jan 2026 21:14:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RZffAHTjkMH8UAUejEXfcxZ5LsDrdvkbT0fpE68KqijHAA+MrcO5r0M3KpJz9JvY8GsyrdJsqdOJs1BQIfrq2dtXxFJ2XL8/1KqtEBvTPgxVhhhQZBWYfox6d+M5brEwwi7Q5ZgOslaoYK/t+eI4HXwSou1xXLCp8nx2BIR1gvAOd6geVemIF8oQNLAVjXWFxNmYH+1FgdWrHmxtV5zt6I96r/INrihG8o2G1+Lq/UgWvNnQRipFU3TMYTS6zivF2Vi2bf3UUS/VwRF3hmDecoYjE0U/fdFyO3T7ov7gcVzhNgmYgJcOoqKRxBMM/T6nWQBB0UpmQuJRticwpQtzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OoPa/Y7fWlmvvz9V9Pkw89MzKpwk/cxj3Byiwurf/Ww=;
 b=wcz7cp6ZktxY3P7ly6UySfS6JIITQXqFXP1Q2KRcVot6KH9E8oFpKbwlKQC9UaVn8zJuRleKfiBT13ftwTCfxv6vrqp/ORdKUOeHcED1N+EGCE/FYFTZDM0lvnNfvzUq9nhDeJnWseB9XEmWznZgPo/kjjs/uq6dtdBp7JAJlDAEwsSXUjXZ4AhxIY6ek4+/q7MmvmPDHOx0KLzRQ/lCqswpUiKQaGP7HDPojhjgmLjWokoPiq7MhJyD9FLtdwWe++5pO4451GOBPGUvcnx+juPC3UfREUB+zDlnc03r4s+zadXe55j2S24bTP+j0YvlH0TytvryDSgcfn5NojLlMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OoPa/Y7fWlmvvz9V9Pkw89MzKpwk/cxj3Byiwurf/Ww=;
 b=BUCSwJekxRgU/AljJ3IhKehWRL0XceYP8WQI5bSsXkEPBgkuKBktAbkcnthRsomD0remCzgOIp0sNUg+Nbw4XqXXxLuOQO01r4aslTdtpwx8EMwDG2QCIi+E3CCLQoYy3GwHVUo7bN6/OVcpgQBHD+bt+zD1sP2gAKYb5hsOPPPz63zZqGAYZFSIW23PPeTYznmHnGecTOZQ9Xk6GE/odx6oG5KuybscOr0Xz6X4bMzj5F0O69Qn1hArJ+o1ae+TVWah/yiKSjDyT0ZdDOhRwBM/PJBIqXBC+dZc1Cs9fSQSmbamy6COCdA9iQez9SbgNHL5gUxam2BWIeFjzRBizQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com (2603:10a6:10:2e2::22)
 by PAXPR04MB8272.eurprd04.prod.outlook.com (2603:10a6:102:1c1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.4; Thu, 15 Jan
 2026 21:14:47 +0000
Received: from DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196]) by DU2PR04MB8951.eurprd04.prod.outlook.com
 ([fe80::753c:468d:266:196%4]) with mapi id 15.20.9478.004; Thu, 15 Jan 2026
 21:14:47 +0000
Date: Thu, 15 Jan 2026 16:14:36 -0500
From: Frank Li <Frank.li@nxp.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>,
	"conor+dt@kernel.org" <conor+dt@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"broonie@kernel.org" <broonie@kernel.org>,
	"lee@kernel.org" <lee@kernel.org>,
	"lgirdwood@gmail.com" <lgirdwood@gmail.com>,
	Vikash Bansal <vikash.bansal@nxp.com>,
	Priyanka Jain <priyanka.jain@nxp.com>,
	Shashank Rebbapragada <shashank.rebbapragada@nxp.com>
Subject: Re: [EXT] Re: [PATCH v4 2/5] dt-bindings: i3c: Add NXP P3H2x4x
 i3c-hub support
Message-ID: <aWlYvMOX/ZzkhMat@lizhi-Precision-Tower-5810>
References: <20260113114529.1692213-1-aman.kumarpandey@nxp.com>
 <20260113114529.1692213-2-aman.kumarpandey@nxp.com>
 <20260114-wonderful-vermilion-starfish-ad6ec9@quoll>
 <GVXPR04MB97786A5E118F5D12A9BA591B998CA@GVXPR04MB9778.eurprd04.prod.outlook.com>
 <ecbb2dc3-7895-434d-b502-cbc82150fe01@kernel.org>
Content-Disposition: inline
In-Reply-To: <ecbb2dc3-7895-434d-b502-cbc82150fe01@kernel.org>
X-ClientProxiedBy: BYAPR05CA0078.namprd05.prod.outlook.com
 (2603:10b6:a03:e0::19) To DU2PR04MB8951.eurprd04.prod.outlook.com
 (2603:10a6:10:2e2::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8951:EE_|PAXPR04MB8272:EE_
X-MS-Office365-Filtering-Correlation-Id: 075cce2a-9ace-4f9e-7050-08de547b1cfa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|19092799006|1800799024|376014|7416014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jgJf0kllzFO7wEaGRTmt2HuEpE+DsYcZ7bGQTyDMof1lt8lc81/0BEbC3cSs?=
 =?us-ascii?Q?OStXXUnTWjZnT9gwHHhnjIX2ikTkxvwq2Bz4rz/p/GNYbGiupDDm/48gDc/z?=
 =?us-ascii?Q?Z5Vlv5ZgQjvtZCWJoVaY/ZsQFcD5pUwIA9uFROIjC3zQHpJl1lKTg+/1Qefq?=
 =?us-ascii?Q?g7GTdpt6ODPZDuETS1raodMMLJM0ogNA24X8TgSQ/NetmL/XaraQn6kwqRBQ?=
 =?us-ascii?Q?TF0jtK2A4m0D0tqSjzlMPn9rSBdmk3R/IxgnnaAJ+oNIHUtczZOzrXhvz5g3?=
 =?us-ascii?Q?IShPCGy0ONwnekB7CXptLE4AOws+Rfx52mkUKb+0SVtg89c5td8FkkifoFqw?=
 =?us-ascii?Q?hkQh1A1haEDiqK6szlB1qpFl7GF18a4pEeIV6PmN0+YD3XT28LByLWA+mvu6?=
 =?us-ascii?Q?qfX87xnBcW1IyHy5l/YK4W+1+67XLOj8Dn3k6OxSLpnjXHdHyLTajeAS7wJJ?=
 =?us-ascii?Q?Zk0bykY63Bp1j5f0h7dCJtmLRNStJ2bbg358jd2C8K6orSdCBQxRuKuotQuL?=
 =?us-ascii?Q?w8PQoDlgGFjSBkne5W7AmCOpCNhOHLPfxIhbZvoDuzvqctUh8RGjLVURJFw8?=
 =?us-ascii?Q?Y5lgKjrxa3ErhvhGAgHZSL1YudTp8y4RMSS9Gx+srKL5z1+htHAX6TxNv5Ts?=
 =?us-ascii?Q?dftjkkyYCmxr5MtSK9K96F9Jr3Q0oxe5DmRObDtXgJfwUgI1WlowkreKdfQ1?=
 =?us-ascii?Q?popsBv1JaBBeaiDUl4ER84snrg3gjeMoZ9jpWhs6ltdzguYiJ2FNSQ5bsDzz?=
 =?us-ascii?Q?NvvZ7shEvwE0wVHbpQin5/5Acu/H6uLE/9msA/hcc33Gi0mGt+dXgr54hMdn?=
 =?us-ascii?Q?Yw5zFCiDLMfz+iP56FQcH/60+xxQTK43xe4R8gG+YAvTQI+DTM+b6xqL3P1W?=
 =?us-ascii?Q?rSv3Bv2tKOpobsSUoEAcNfOkEqDGTco7lJqDdix2+lOfKohzBAdou8FQGkpH?=
 =?us-ascii?Q?arjy+mCndosGw4EO7EUSQG4g3yTriaBTMRld+KXnD6rFfF0FA82a+aOoYXgi?=
 =?us-ascii?Q?yDN1+M2OrYJb3AUc8fEh/84xmtdWaE+KnHZLpyJs0oMtrsyS45LpLvg/ASCj?=
 =?us-ascii?Q?ZwA4G19VCtSipkStvwUWQOneS2GUfApDYx8GtvJlFdCczD3j/prPoJEZ7Yyc?=
 =?us-ascii?Q?N/0KTHHpwUdInhFXrVyBXs6ImuAndWnWa/2ct1HXm9dGadMBmg3x9+wTtE9E?=
 =?us-ascii?Q?DJf3YAmIMAuFKUjVhzabmbMzJIAASXLcbe0vDN3YOqvm0GbkECdr9hu2NJGK?=
 =?us-ascii?Q?x+KRHQ8GOIiN/pQVNzFC8/i8CSOV/MQ3j+Q3UvKrapVbTBuLKJSZpiJtA7La?=
 =?us-ascii?Q?cbUJvGYOAHKeXqiNc9S+9cMRl0NSRYVkmuA8rDXAcXs8jaquXyubijDFxKGD?=
 =?us-ascii?Q?W+J75KvQSPZTAC43auvZt1o9DTIC7YqbznI/H5oOcFQwnmgQpVzdxPRDUD05?=
 =?us-ascii?Q?3CCio/lJZY1V6xDrVjgvshYjQuzji3ngdsMiwUQP04uf4X67jQMRJpvk40kk?=
 =?us-ascii?Q?CKISCIMuo5pN2B0sJKxZW+OQFOHcjlQIzEZWmeyhMPxK4q4mieCK7DjOpaXi?=
 =?us-ascii?Q?z83Kw9SwSwdh2fjwEL8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8951.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(1800799024)(376014)(7416014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tFT9rgAfopZwF+uGBwwFuA7clZ62iYKuR6bCWUXP0hrJ263VaDhO1DPwVl4a?=
 =?us-ascii?Q?ibmsOuneNDbhLk4Ofr9EpdI/6U5ywQg0am6TNK6qXzYGJ+MvlsfFzAOIhCWu?=
 =?us-ascii?Q?AtAWIbR1pmEsETtXRsInEa53G+0JHVdnd2HOCoDVcHGi8b/3J+3PKpx8fvaJ?=
 =?us-ascii?Q?l1aMXRtWDODNmB33k8XGdmSfBw6si7OlqIoNSyHkkziNOGUgjxWG2B9JOJ0Z?=
 =?us-ascii?Q?NssIpysABshjRqDzrpJ86mbnLHBw+pxv19cHy13duZyBjngx0x8ngYp+L/kx?=
 =?us-ascii?Q?h8HHxPZII641pBnHtbfV0QPsfzRFYD7pv9sLZiVXLDyv1/nCxBeYqMr/p5Kr?=
 =?us-ascii?Q?5+OuYg4KW02CUiAkqH3F0xM18X2GWn8/2UxQELkRwlfnd16S4N9BjB+1MT2R?=
 =?us-ascii?Q?yuQJHdJQoDtjJZ1k9dL2u6q5BSz2lbD2tlwml3IikiKmSjhbOYVzaB1mvwTu?=
 =?us-ascii?Q?uj7boe1gAtCZrDXEn9yrHR2EsSsLMi2/8hKSN2lqa7I74D5vyS/YxK3oepVp?=
 =?us-ascii?Q?w8RAZ4iLNja0w52UWbiQlJtVr/JlGMZCzI15idWrXrP/Mvtqjr7JG8omvjBU?=
 =?us-ascii?Q?MGeaJt3L4HCctctPw6MPj9psZemn5FksPrGLWcDzaDT/pbWfsvEJ9cmJ2lqS?=
 =?us-ascii?Q?buM4fE3HVYNULktLxb+wPIhwLJp+4o72LUdWadUBjGiH6hPN6/HFmSi5LMwf?=
 =?us-ascii?Q?olhsW3IVBiMxfNa7OTUkqu5pwUud6IluzamkO3CAEexuwZKFR1Cv/B+a3nhf?=
 =?us-ascii?Q?38zFnA16MoT2JtT9NhMrXlsLughpvKuc1//XaA/QYd+z/65H8l0H5IUGoLpj?=
 =?us-ascii?Q?MqRcePXO8IQa61wGtKzTBk/pq4kHkrAcn1egZn9HWKP/8KkAeJa1+rJ+RVyn?=
 =?us-ascii?Q?HUfe6Zs2G0tu2PuSVf6Gbs/mV6kb2Uum0Rjf4p/BvSD7nEdTkskCSaNpFRws?=
 =?us-ascii?Q?kJjBrIGG+VaQXLuXfKbsUAepH1I9R6eQRY/rx10ugtGBUYt6FpJJD8xRgoul?=
 =?us-ascii?Q?I+BcfJ57o1xjimyQz+VUG/FrSzBJAIEVt1vDLD9BSyLlP2/2F+LugJxzUcCP?=
 =?us-ascii?Q?4BTqP1puV6ccBipUxen6P1pwpPP+rviIQTYOthlUYwEzdWwg3kE2w7hcmev+?=
 =?us-ascii?Q?xHUm1ZzQRarfXgdVv2IbfUBL79n+C3SEBR15oc0g9bAbv83RMW7PKxoPqVVA?=
 =?us-ascii?Q?UGujXUK3SkW+8FE9vZ500NyGplFRtyTDVdC5hPhsammCK5uSgvkAnoChkXpj?=
 =?us-ascii?Q?k4lGWivPsMyoIKJB2xm63bOwWReFUbAgfx2grySjMZnjizNoaDu51K37C1pr?=
 =?us-ascii?Q?Lm00PIfk/TGaPyF17SY+kSZirIko+QFmptRRdAHeF3AjJYB6FCbeYGkYsIGz?=
 =?us-ascii?Q?aj8Grog4ucllg/ZqIgtyubApMClYTMySjMNt4JOy0VxhKiFgp4v3/tGWszPX?=
 =?us-ascii?Q?Ua29FKeI7VJuhJNBa3095RHxxb1E0PmI2nWDbvsX/ZE1KWXW5v9AF9mEIEo+?=
 =?us-ascii?Q?C5uyy+/FXBVEwi+ouf9zNEGCvNgqAWnRzL3Q34LTERsmVq01EkIWtm3vB8uJ?=
 =?us-ascii?Q?gwA9QSxLlcyAOv1wcgKPZ5IxqTbfnzV+U08791ow9XCSi1lHckUHtZpr7+bQ?=
 =?us-ascii?Q?5gOtAnxT66/VYhZEBH0qkApHrUiaork39kwVjrOvZB4reclqsUnasjq7AmVW?=
 =?us-ascii?Q?Ho1Flq7LP/c4yYZXyQFyd46PYU4sQzo5Zx9sCwXoxVm3MPqE?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 075cce2a-9ace-4f9e-7050-08de547b1cfa
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8951.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 21:14:47.8254
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9aqUyrTxHEWH1LmEZydUO4L+pKtV/Wh4nyjTMS7OrbyYf5iVI3eP7+uyov6pK6r/9d5pOFv4W945KWfEjHGwjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8272
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_131451_949699_A55B1238 
X-CRM114-Status: GOOD (  26.29  )
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

On Thu, Jan 15, 2026 at 10:01:03PM +0100, Krzysztof Kozlowski wrote:
> On 15/01/2026 13:21, Aman Kumar Pandey wrote:
> >
> > On Tue, Jan 13, 2026 at 01:45:26PM +0200, Aman Kumar Pandey wrote:
> >> +https://eur01.safelinks.protection.outlook.com/?url=http%3A%2F%2Fdevi
> >>> +cetree.org%2Fschemas%2Fmfd%2Fnxp%2Cp3h2840-i3c-
> >> hub.yaml%23&data=05%7C
> >>>
> >> +02%7Caman.kumarpandey%40nxp.com%7C75a7d6f1f8b74fd3ac5808de5346
> >> 3133%7C
> >>>
> >> +686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C639039758104017624%7
> >> CUnkno
> >>>
> >> +wn%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwM
> >> CIsIlAiOiJX
> >>>
> >> +aW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=Ze
> >> GSgy3cF
> >>> +whQbcO%2BserynVrrrqYGOIwBMgVjgdY25Lg%3D&reserved=0
> >>
> >> This is not a MFD device. Place it in appropriate place, e.g. i2c or i3c
> >> controllers directory.
> >>
> >
> > Thanks for the review and the comment.
> >
> > I would like to clarify why I modeled the P3H2840 as an MFD.
>
> I do not see any model as MFD. You placed it in MFD directory and this
> is what I contest.
>
> Otherwise please point me to any hardware description what "MFD" is,
> because for sure your I3C hub is not this:
> https://en.wikipedia.org/wiki/MFD - scroll down to "Multifunction
> device" in "Computing".
>
> > While the primary function of the chip is an I3C hub,
>
> Wrap your emails so it will be possible to reply and read it.
>

Aman Kumar Pandey:

	Don't use outlook reply community's email. You can use b4 + mutt
https://josefbacik.github.io/kernel/2021/10/18/lei-and-b4.html

	Company's outlook always mess up email.

Frank


> So there you have your primary function.
>
> > this device also contains a programmable regulator which is exposed externally and can be used to power downstream devices on the board, not only the internal hub logic. This regulator has:
> > - Independent enable/disable control
> > - Independent voltage configuration
> >
> > From the board and hardware point of view, this block is not only a "hub-internal" power control, but a board-level power resource that other devices depend on.
> > hub logic and the regulator block have distinct roles and different Linux subsystems (I3C hub vs regulator framework), I modeled this as an MFD with two child devices.
>
> Linux subsystems do not matter. We speak about bindings, not drivers.
>
> You ignored some of my other comments. Your email is completely
> unreadable, so answer is still NAK. Read my comments fully, fix your
> email setup and then answer without all this messed quotes.
>
> Best regards,
> Krzysztof

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
