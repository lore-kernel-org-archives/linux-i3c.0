Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95BC9D778AF
	for <linux-i3c@archiver.kernel.org>; Fri, 23 Jan 2026 19:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DjVZBmsgOT9Wfy0JYtuVYBt/nyCdFc57aoZrshKtfeA=; b=4GzHEiP+2tjao0
	T49r43JNO+2ZHCPPnKInr1ODFoZZdRAse177BkAmIiQp3yFa6sxaBUrBOOivnp84LzYDOmHgfHqI/
	/RoZUzswyiNtbzVls2BrQMtTL3vhGe8fmC/5/wU5LOMnFqlZ3eLFW/C4MhTQQCB4RIOXZXB5GPdSE
	U8PxHbIIozPemn63MQFYJmB75Wa9/pn2UNohwjM+S2mZQcoN/P3HyVbuw7jlr19iwFEib8wHG58wu
	0foeqq/q+eK6UVOlYtN9GJiE0ZE+sKUJbO/97nWf5cPJAE1vF4ap6WbIb1ows3K5cHFf8kk2zIfzN
	xJIH6uiXdSLybURWqz5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMyr-00000009R1Z-1VWt;
	Fri, 23 Jan 2026 19:38:05 +0000
Received: from mail-westeuropeazlp170130006.outbound.protection.outlook.com ([2a01:111:f403:c201::6] helo=AM0PR02CU008.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjMyo-00000009R14-2AKB
	for linux-i3c@lists.infradead.org;
	Fri, 23 Jan 2026 19:38:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SSnKrNjsG/jxYyJsfOzRLZNp/b19PI6UBTjTVd4SXNpGytU8aY7WLXVgWJYAv/ujtS6SVSBiyXipDO6oY0hum4puh5n5A1y/XwNDUV6HwJTuV6u3AqKeiGMco6dtjEqFB7ZFnNtL6Szqb2Ed6qaNvdlwYgk7/vkM3KUaV5m5ai9wriIzdaasZs7l38JzTBtDwwqLPt/wP1j2KhA06Tz7NPOxUVHoe6GupNkp9FGANzQNM0eut09moKnwOLKQVYNGERQhjFeJmD37CzHDDMBHMv8d1T/y5wBYEPyjWQXyuXwZ8FDg4oa/v/3J9atjv3c5ATAcWxl//3L/Vyqu+H4z7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rPT2ITZTNUgclA/tF2cnabP8WLHqeWOqCKNXURnR8Og=;
 b=Y4ia3RvrWtIUoSnfdpImzf+Cu0/TDdzknrjq7HYujyuspoveqjMHGJvgtFJF7pBVaCluLFcpgfi+Fmv2JbH2ghJnca7BDr/1Z0iqNQ//VZwny1SqvRotCOC5lnZ8QC121sbUw68PoQE1cFGrfI5hfKT9PJAlm2qgYjzH0BuviUuc9QutxEoTpbkjuFrvMltpIhrGHcyPXOlmbDF6AsWQpXZGc2Hx2YI5Dek/3zTZXb/Js4h+mDkIBfZ9PTX4wEurXDqCYxaURrjCRslZVtUUgV+3eE6UCEkpwlxQtsWd0O2Sai1pEhujkPynQsoEJRK+dLvjCe74Ll0oXplsVvTKfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rPT2ITZTNUgclA/tF2cnabP8WLHqeWOqCKNXURnR8Og=;
 b=Fk+n1SFkYDxwV3nijXmrKt89xt4h5aTrDu7+OBUMeAqqWL+O2bUmRzUbSpz+UtX2EkdNhhnmLyHJQWLRErxJVXpul/ChAGouHHonQckRKzUuHUEeDRH2/RVOJbMF+4XO7agbeAjN5xdceRwEowQjbcUtvAabs9gDkLRAxoOb6IWVPLyeDfv3AqGUSGmaD3OIakUHvhAI0NxsFUqlTS6Tp6gbRZlGMTyK5dD3s33Nj3aKQWXJj/BA6tZYFm2RCSXJAyKZ6kirTTpkA3e27zjNeppOVrnQM92/pmFcbgcS0Y57FMti1mB4joveEz43aLw0lfmEW6HMCrrcJ2+Wyd94wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com (2603:10a6:102:20c::5)
 by DU4PR04MB10646.eurprd04.prod.outlook.com (2603:10a6:10:58e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Fri, 23 Jan
 2026 19:37:57 +0000
Received: from PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5]) by PAXPR04MB8957.eurprd04.prod.outlook.com
 ([fe80::9c5d:8cdf:5a78:3c5%3]) with mapi id 15.20.9499.005; Fri, 23 Jan 2026
 19:37:57 +0000
Date: Fri, 23 Jan 2026 14:37:51 -0500
From: Frank Li <Frank.li@nxp.com>
To: Joshua Yeong <joshua.yeong@starfivetech.com>
Cc: David =?iso-8859-1?Q?Nystr=F6m?= <david.nystrom@est.tech>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
Message-ID: <aXPOD/klC4W/aUbs@lizhi-Precision-Tower-5810>
References: <20260122-i3c_rescan-v2-1-84c74a483f03@est.tech>
 <SH0PR01MB0841E47B510DB5EFB48B3460F9972@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
Content-Disposition: inline
In-Reply-To: <SH0PR01MB0841E47B510DB5EFB48B3460F9972@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
X-ClientProxiedBy: PH8PR22CA0015.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::23) To PAXPR04MB8957.eurprd04.prod.outlook.com
 (2603:10a6:102:20c::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8957:EE_|DU4PR04MB10646:EE_
X-MS-Office365-Filtering-Correlation-Id: 000e9eec-a0c1-4ef8-f5b4-08de5ab6e8d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|19092799006|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?eKLDbxTn+CudACHlXNQdLfODLJ2t9HEe2yCYMNbynxi9fphfhnG/6Twmms?=
 =?iso-8859-1?Q?WHyyq8VLyh6/mKrhxae+WxymejT8UvKIa3oeIoAf9GisAf7SfM8sfiRCId?=
 =?iso-8859-1?Q?nEq+fZjtDvqkj6yEG5uZj2ow2D3LkvGEPwR3jxEU9g382gC01NKieS3JCB?=
 =?iso-8859-1?Q?iylI2KnD214b4uvM+5H+2jDJ94fGcPjg8Fefpb68X/sQ8JpvFI4GTt4EN/?=
 =?iso-8859-1?Q?bEL1JQry2mzS48vUPUVyI1Pff+ycoLrndEKNejK9s1OarMGHE+bZ7iN6+A?=
 =?iso-8859-1?Q?IykHjXcbp7y32RPG4d1Rl0eVOnef+NK9WgejQ9z6Z/7QLL1TqnYtaHlE5z?=
 =?iso-8859-1?Q?oK2p4giLIu+tOR1YUo19dioLVTYBC+nMP/vfaB3vrYlMYOjoFC5WFqjSus?=
 =?iso-8859-1?Q?bZToJxD/BZ28HdfIzatoujpT8jB/L+woQsfrDZskGdR15+n/Qh8n6Gpz+K?=
 =?iso-8859-1?Q?oLe4W18yF+9J3mslcs6uCx9PIBmHKBys18voNpsIYaz8gBAy9Hh+im+xuy?=
 =?iso-8859-1?Q?fi/c2OXIWPFZ1YQgVsmrNAUEPK1QFlFktOL3e1vJQgfdIJlkKZdOyluxps?=
 =?iso-8859-1?Q?fs/+u8moLqlGeJslOSFYnHCva4jojNLz4rLQuAc8/9ckd35jsyVhJ+eGDq?=
 =?iso-8859-1?Q?IyptGbgtocRMslA7Ky0ermBv/IFCw+M3aax4nyEKRRPf9FmBlcGBSdYFPn?=
 =?iso-8859-1?Q?RZehLy5EHTtulQe44UA0POdTq52uu7v1QVnydBmF/lpn2qZ4lcDYmVXshF?=
 =?iso-8859-1?Q?GYKOR4iYnOV/b6jzTTfFsf4NAmEfrBGqB9cGj4OmLkaiidhKUuyYlM0ir4?=
 =?iso-8859-1?Q?wRN9272pxiFGbsInI0h0j6sTp4qYmXh6DLlLVXHgQZHO/e4iXZxM4xcHBF?=
 =?iso-8859-1?Q?q4+T5VvZioEQOC8+19IX0wQs+WYRuN/d9FKdiIlcOMqgzptw38pGgapGuS?=
 =?iso-8859-1?Q?C0gRAqR2DTSFxkt0+DuEIR1XHU4ttQJzRlihar2LR6+ecWs6N25Vt6P4Er?=
 =?iso-8859-1?Q?B8kOXBCyMSv+hnjp0sePAZfDuA4jDpxJMY2XzRRQ4xOK100zTe4hQM/Iu9?=
 =?iso-8859-1?Q?jxPn6KUwPtf9bOjgh23yNH4yd3xB29QD2AE+Ltp38y228Sgw+dXRDk9wCa?=
 =?iso-8859-1?Q?CYC1H3VBJUQtUSStAWZnNIQbds4hXi+EmWvb9ixPanOBPPDM+KSb9+5Rpf?=
 =?iso-8859-1?Q?8Lnb7/mpUrmpU10ZZYbR/CH3eUPlYgYxAUIVFBjLHjg0fXCd8SyvHna+GE?=
 =?iso-8859-1?Q?CaHvooL+NDzDXqzHhFRqeIyio4OYJAX2qrLfR0LhCQ4IX5wiSM0noNYwnS?=
 =?iso-8859-1?Q?jCQsklyCrmMUvK4PaEQjNedicD/Q0FbgGsF7MgRROlt70hEzM0QhxYd1iK?=
 =?iso-8859-1?Q?cDtgBG1SR+M8TjMiqisOspzL4dcJj9pMOh5BlKpWmXV7PKIP1p6xqjNnsn?=
 =?iso-8859-1?Q?gA6nrz6GPHTb8FH7aVLi8HEOYMO1r3ZqaVw3/f7H1pjRIMFGj2099B/Oan?=
 =?iso-8859-1?Q?gsCXioNMcwAu/VolUjHUIngqHvMPjVgryR7uUJcso4x3EKZNrgn910Eql4?=
 =?iso-8859-1?Q?fE2MvQyGFzu8i6vyMkFLtcPw/PL2XvlCoO2sCLJwF1l1OJmIWsbAu8MuUx?=
 =?iso-8859-1?Q?ngjQwtgzB9TEtIpwt3udZgazCrNY7sWwUK?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8957.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4Frz7xc2MREMBjX+9f3wyeCmZLCjK9HdiZzMpZla769g+1u5AV2ioEb739?=
 =?iso-8859-1?Q?rs1QsUM07yQdXyk0muWPn4fZLeKmmt6QwXfLrRyfRSbFJfWsdZM+IOMEzz?=
 =?iso-8859-1?Q?8n5cGJeE1OMAG4Lma5gPNS+UjGOuCNLohdPp72T/bV/o/NT/QP9y7cbq2h?=
 =?iso-8859-1?Q?/vwa6GYmdNEpMJ5BRTf6bI5lF/hkSkoa5TEyi9562JDtZGTPSxORDzdpTD?=
 =?iso-8859-1?Q?RdJGk52eM8ZXfiSFOdvoLjvoii/LxaS5IXU1AFpm+PHpfPnPVWvH6ShUhQ?=
 =?iso-8859-1?Q?L3LIykRz7wxa5D2hqRyQ4jjoMuDC50SHVHHwlJRKrQ/mWnb+8IpEeYwKPx?=
 =?iso-8859-1?Q?XopEqsCvVx+keArA286WikyAx0vNGKaITSNiL3e0riSoAODESdoph6Xxgl?=
 =?iso-8859-1?Q?8kcsSsn+4hWCX/rKgGgcYr+miew0ux2ZOV001IH0vMxFWjultTDaGbVQ9W?=
 =?iso-8859-1?Q?OtKHQ/hkpUS5oqVfmsFyrD9f2LoTcaxJyrZcDt1waVH+dZbPYBAOLSr82j?=
 =?iso-8859-1?Q?zFWCD5JF0w80IRBUnjHje6rj0iSkDfTlo9hY7OekJWxUtON7TxzYP+rgc/?=
 =?iso-8859-1?Q?nGCJwUvv5wXdMDqz94TfJRRUlhfwPEV/j+pA48Hsm4wMEaeS/k32QCpGlm?=
 =?iso-8859-1?Q?/aZcdwonoOApNflJjBctjpE6gTyXx0aaxG1SHDRUEKgw+Ou6EUZxImu7US?=
 =?iso-8859-1?Q?crz2B+10a+Rl0AMhc8bGuw9zGgEaF7Cq+2c+wR6Rd/DG+lq7kduwhf4Wk+?=
 =?iso-8859-1?Q?0qQhETT4upqez4Inb9BlJ1M+vHtu7ssw9lkhGvJ+kDxMSlaFJYlJ8tvWtG?=
 =?iso-8859-1?Q?MgoAX4FPNleh8jdjd6nOCuv5ehl7DyjH8AehCTKmN+HOyTVYlzEcopW/Bk?=
 =?iso-8859-1?Q?1v2NYLXl8RoJAXlrUJhmvsyZ6NbMjNn8wZCDkrnpBTZx7hzfoEA8CLmJ2K?=
 =?iso-8859-1?Q?qr3xp5u42q31SNx0MHuRLovabQ5npjVgHg1dxSX1+qtUCY4GHVrpJoD4E1?=
 =?iso-8859-1?Q?tikbOzlJ3VOaUI8hQex76HkpK7PSegUtt5xuHmxVw3qKoOI549zOGFIQ+Q?=
 =?iso-8859-1?Q?l/fRdiPkcmNeSyPlGQSKg9mo0rdF9rb8YeJtwVC9F1RKXkLosm+cx9nAwz?=
 =?iso-8859-1?Q?+/bZQJ/55nLwGTCs8KZxzD5OZJc903vUhn/IxXs2/A/9SDhglGIKl0apZP?=
 =?iso-8859-1?Q?kb9eCsCOr0uNL5miFaYj2NK09d7i2i9mZwoHkmFMKfPlyphLu0m20+4Flk?=
 =?iso-8859-1?Q?sivjtWNpPXY+q6Hg8Fkixm86qke/D+8qUkPQNEbCx+nFPzOWZfjm2ao7tS?=
 =?iso-8859-1?Q?I2nbj/PNxqD8KSnwWQRlywnTqrm/X+crqFxGsSssQL7FmxkuYf1BH/qy8d?=
 =?iso-8859-1?Q?J5adhozMmsvWGLVSxKZINiKdB0fUP6S7n13NtvyKuRxTcL/BjW/i5QIDSd?=
 =?iso-8859-1?Q?CRnVvY1UtpDdXKrdbCxuz38vqVyZJNb+gndtJ2bivhH3Vq6A2mVH2NVI+2?=
 =?iso-8859-1?Q?Z+4qrvLafgO829n5CxY2N9kTp/SuDB9FUcB0Uvq8H8TtDBeXihVX3dqGgI?=
 =?iso-8859-1?Q?myRKSFhFZXZ+1scpp1Va/937spdGnaoMDKIXZq1xq2Fun2UKFP7ghjD6Yi?=
 =?iso-8859-1?Q?kxMU4IXQ5NwxmmHL0txJ/YLZhrqRQuEon6j01O8MBa6Z0FyW2m3vomw4vG?=
 =?iso-8859-1?Q?7BWMqNErxneVy5YxO6O436RzbfDS9c4szie8y9M83C5gwLoewVFpLg0zzc?=
 =?iso-8859-1?Q?NUtdSE9DfGZP2Ou9eYdWfeAvVamNwinvMmZiQkzHNogDwy?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 000e9eec-a0c1-4ef8-f5b4-08de5ab6e8d1
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8957.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2026 19:37:57.5465
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ROvvwuVO2u/8Pnq763hpyPuTNoHfISpCdFXSvplt2k24c5reV06/ZxIBdOjyVHwiPf6MYkhiqz3pvQxNDdTblg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB10646
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_113802_571563_72E551BC 
X-CRM114-Status: GOOD (  25.79  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Thu, Jan 22, 2026 at 06:08:29PM +0000, Joshua Yeong wrote:
> On Friday, January 23, 2026 1:58 AM, David Nystr=F6m wrote:
>
> > Add the ability to rescan the i3c bus from userspace, i.e. provoke a DD=
A.
> > The usecase could be f.ex. an i3cdev userspace driver for a device with=
 broken hotjoin support. If the i3c device boots slowly, it might be miss t=
he DDA during boot.
> >
> > Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> > ---
>
> Can we rename rescan to something where indicate we are only doing ENTDAA=
? I think rescan keyword should be reserved for complete rescan of i3c bus.
> DISEC -> RSTDAA -> ENTDAA -> ...

Look like this is more userful. The only do_daa() is not enough for rescan.

Frank
>
> > Changes in v2:
> > - Improved the commit message with "why".
> > - Link to v1: https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071=
e232b@est.tech
> > ---
> >  drivers/i3c/master.c | 24 ++++++++++++++++++++++++
> >  1 file changed, 24 insertions(+)
> >
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c index 80dda0e8=
5558..edeae7493b3b 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -758,6 +758,29 @@ static ssize_t dev_nack_retry_count_store(struct d=
evice *dev,
> >
> >  static DEVICE_ATTR_RW(dev_nack_retry_count);
> >
> > +static ssize_t rescan_store(struct device *dev,
> > +			    struct device_attribute *attr,
> > +			    const char *buf, size_t count)
> > +{
> > +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> > +	unsigned long val;
> > +	int ret;
> > +
> > +	ret =3D kstrtoul(buf, 0, &val);
> > +	if (ret)
> > +		return ret;
> > +
> > +	if (val) {
> > +		ret =3D i3c_master_do_daa(master);
> > +		if (ret)
> > +			return ret;
> > +	}
> > +
> > +	return count;
> > +}
> > +
> > +static DEVICE_ATTR_WO(rescan);
> > +
> >  static struct attribute *i3c_masterdev_attrs[] =3D {
> >  	&dev_attr_mode.attr,
> >  	&dev_attr_current_master.attr,
> > @@ -769,6 +792,7 @@ static struct attribute *i3c_masterdev_attrs[] =3D {
> >  	&dev_attr_dynamic_address.attr,
> >  	&dev_attr_hdrcap.attr,
> >  	&dev_attr_hotjoin.attr,
> > +	&dev_attr_rescan.attr,
> >  	NULL,
> >  };
> >  ATTRIBUTE_GROUPS(i3c_masterdev);
> >
> > ---
> > base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> > change-id: 20260116-i3c_rescan-4921d0b41a00
> >
> > Best regards,
> > --
> > David Nystr=F6m <david.nystrom@est.tech>
> >
> >
> > --
> > linux-i3c mailing list
> > linux-i3c@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
