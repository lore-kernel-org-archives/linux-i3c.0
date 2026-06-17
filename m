Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE7DBCD98E4
	for <linux-i3c@archiver.kernel.org>; Wed, 17 Jun 2026 14:50:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VC6w5QbK9OoA5nYfQSN/DyhErN3z9Fjl/riub2Nq8dU=; b=PuMeIGdpFxjUsE
	j5pCYmBWP+MjF2ejCRpVyDCqMxxiZ4xHb0kBABz2OyYIkWKaLQ36PdJkqs0wtJjdH93kXSLUZcfE9
	7pqhg+EVAZ79505mQNnW7MmQR3a5aDz8wLEO0cIGyAUgpYOkwivQWEhCJiGwd9DLCDQNuk87iCtkX
	SqLTW5/XfCg/e+Yi1pyeXne7pYgZqYFrtmAtuJ+cEkHReQcpQy/ibj2UjNoKv0bvo80F5RD9DWgmH
	s8xrC1gPEzdNFNtoo0NnS99eEVGdWmKVZfpcaJcYGCKY451LNs339p5W7Lhen2Uzrea7V+ujxeKin
	HBlWb3G/dUwILSOi1K4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrbB-0000000HV5n-1saB;
	Wed, 17 Jun 2026 14:50:37 +0000
Received: from mail-francecentralazon11013034.outbound.protection.outlook.com ([40.107.162.34] helo=PA4PR04CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZrb9-0000000HV53-17En
	for linux-i3c@lists.infradead.org;
	Wed, 17 Jun 2026 14:50:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GmFLTydDsfSDMHFEf2QyjtXBnhRwAsforswKs9FKMvQyQlSAC0dV5Ze/mLIwcQu1qLReMHZ7f58MktbkWjbeHYlJHEFkJGEURqPwYIQgHSmYwUku0KUhl6d9XcOEO6l6m/PMGS3H9tHQviQJ790IMz0dpWaf/hKrxGuFfPFIBciAapp1wv67GTZRfCFwxV9t5J5CT7NulPxcFdy64jlcdMEOArZT8nENpj2/Yu3Ubc+/4bkgNphn+M++MEev2cZO5q5grDREyfXpri0zkNS6RxHm5AVUMSlAEGJxxUj6u6Lk5hD0js3lejYef7xeOPBPVBsAgeB0F6QTK2h3tpWFmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3hj++v/+QF2Xw0o6zZbgXmV2PWMo01+HEu55IyrDzkw=;
 b=YdBf1FgQGER5QGF4wyyZuQJO6EP2MAYxh7n2lPsrct51HvP0h85pKXC4L7t4duHqXcl4jQHrvkCJe7BaVe28seUE/Hl7OeaIOCCZCqvDXK4KJIbYpfpfXXD5CZtvLGYBS50dMcenA3ZG7SgG20Ba4ypIAnDuh+LLH01dXdr0S3lxOorwqJOgAgmDb/5b1nSsE2dg0vPrk/Q9EL9Ny1xZ2DaRZX+8C+yo/qnEFlfwIO16dpeACZLprRzsGTVf/FpVfSb6DE2nR7pLEP4S30jfpLtcvdfkOLGLLf+5h0EDFbTMx7nFWLmZY4w6XZ/oRTiwmdgJg6bqA6Z9sh8KcttOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3hj++v/+QF2Xw0o6zZbgXmV2PWMo01+HEu55IyrDzkw=;
 b=iT6hE7OonfGETtXlCuFlNCeVIU5zkur8t6VHVyszNS9RjW/dIqVgZIvXV3m/c3WbeiaOmyJH4ff7NqOIJkb+RNUiH55eybWbUKGqUqY9bFNr+lXUQ3FH6LQYLIcFEdJTErHHQjSVocVbJfoF05qZb5ZP//jpxmpVpZYXm+fbAeybmIXHsEUjdzz76y41+UFTVmZE556ZeKFpNN1EneMIhxkViCqzArPCRS3c2jlHMTOr7obHcU2SMmv6jH+hRvDpDHY52J4lsf/9dgoO4OlZdGoCpOnh38CaFbbcw18D5Srd1l1sxEi4RQfiipmegTJzGUJQsqcl3+zg46OFrYVCFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by DB9PR04MB11625.eurprd04.prod.outlook.com (2603:10a6:10:607::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.11; Wed, 17 Jun
 2026 14:50:31 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.015; Wed, 17 Jun 2026
 14:50:31 +0000
Date: Wed, 17 Jun 2026 10:50:24 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>,
	linux-i3c@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org,
	Frank.Li@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 4/7] regulator: p3h2x4x: Add driver for on-die
 regulators in NXP P3H2x4x i3c hub
Message-ID: <ajK0MJgfx2YXODI7@lizhi-Precision-Tower-5810>
References: <20260617110355.1591844-1-lakshay.piplani@nxp.com>
 <20260617110355.1591844-5-lakshay.piplani@nxp.com>
 <20260617111744.1A0971F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260617111744.1A0971F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA0PR11CA0002.namprd11.prod.outlook.com
 (2603:10b6:806:d3::7) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|DB9PR04MB11625:EE_
X-MS-Office365-Filtering-Correlation-Id: 071872a9-0f23-41b8-77ba-08decc7fc72d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|18002099003|22082099003|56012099006|11063799006|6133799003|4143699003;
X-Microsoft-Antispam-Message-Info: M/KxEPgN6mc66tUMOCBGhEl8B07G/1X8J0PWR5FfDbqKYNVMtsCDspjspNCcpWlbnPE0AWWfsJnK0YPvislEAyA2H/6+IwH/oj8kgGIiGJx6SpAXgat+n3o8RD4NdKtk9Ijp9Q5m+VkvQnSw056ywNwaLsxdwkwkFrQ6ldRmTeLBkIpkojw596HxCDwo7bejSrT9vJxlJY38xFYYsvvQeg8zvcRgG2QzNK89EWlBL1nj+tTRJ6S3HZ/elYOfRuWNPS6UYs8uQrVI6z6Bxp0AFjiwKZaOLd/hnPmV6vSqJltMtir6Skt56MNCizpB3SDBgMxiQJBzaTiD39rFGVPms9F5SraiIHI+7gVwbncvLgoZID98Uq6wD0mlvjFvnc/H5/1V3C3YzBP6TFWH3N5kr4awel7vYOuhFxpgSgvYuVrdeobwDaaEzn3wHX3cl/5VAGpiRCVwpUijIG+hJ5nEZLjFbIalSdV9KQ69+9HpxZEwY7D47b63c4VU5Fo7wdge87DGxmwRXn1CGuNHgvZCEHCMp8DQpBNGWnFsaAndalgTWghEvk0D4a4aO13QUJr0LMkts0qEwKNH+4B6JQUvofkwb96Zsvi0rwLaq71aHO0m5xsnbINA9raGfhNshxh8LGGSwlneLIjCQnhCYENo1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/GZUl+4Wa1pXqdeI+lYovAqe99sUeuJ66YE/FsBe4GfetX3oK8WnvwsYvZ?=
 =?iso-8859-1?Q?Ad8Q/fUvLp2yjO58urF3aHJ3+/lE38awjqUqSYeEeSiU/854ElUsFH/yTM?=
 =?iso-8859-1?Q?Gi10yPwebreKz1xsqk6ilVMYTNH0wWTipLh9Enbf+nPEIiEAWABUQCs15F?=
 =?iso-8859-1?Q?PJjUbQj2brCurjB+K+Nez1mcOPHWtXBGxGBtDWAj1CFbOJGru72BgXHTm3?=
 =?iso-8859-1?Q?DMPUQogruqY3zjSBb1HKDrZet/8z/YezwxyazATuj5JTVcEIf3ZaKcw8tW?=
 =?iso-8859-1?Q?JYK07W8CnZtmcPuabH8MJBUH3CxWpnGLIVOmN2Qh5LlQdp0O2Tu9206DcU?=
 =?iso-8859-1?Q?l4HW37aX7NaieWswjh9k3vm68zgeT0cK6wDcqy8bCZjLpHn1X2Vzp3YsNx?=
 =?iso-8859-1?Q?UU/x+I1w42kMs/BnOgkeUTkXCjj+hvlg+xx8eX5zF01E9FXzXEtDiHVjhK?=
 =?iso-8859-1?Q?0w19bKSbXxsU88dHGQQ6ozNiNWEo9ZQn4GhRiMH79/wUpE+gErDxeyEJik?=
 =?iso-8859-1?Q?Wq6KqVaycvn7WOQAPsicBYSK94A6jns+d83Hi/JkCXlCL8GYpGjvcl+OTN?=
 =?iso-8859-1?Q?fsSA2FNbjxZ5bJWgguU5OaGmbAKGpVi5D38/AGCzvvB6UxtzUXittki6bY?=
 =?iso-8859-1?Q?3QN4F8f6qgbR/mxZ/RCsxOwGt4/3nuSL7A0QXo4ZVPo1DJ/7Lsvlj6Ec25?=
 =?iso-8859-1?Q?TmWLi3W03+dkSIpHyq9SaQ5jof3fetiJN+pRrO6vz+jAPFRSlvrUhoRydK?=
 =?iso-8859-1?Q?LL9BkgF4tYG+SPQj7i+BQO2M5BBH/gbdmcUyX6My1MC1X6ndsUt0oru75O?=
 =?iso-8859-1?Q?nM64U9LFWh6ssbYOn0vDQT9fPtkdPF+tVX3uToNw3IEGX4eW3BRZHsnOJ8?=
 =?iso-8859-1?Q?FkWWrB9H3VUaw2iuZMbwrF5F1ENxCaL8//xNtudBLW4zYNdplhONqJYdW8?=
 =?iso-8859-1?Q?J02m0Bj/29zZ8YK5fDBu5Xwz+BrHIZS+yXTqF+eUX/IAs4IBb2vu+yro0B?=
 =?iso-8859-1?Q?f1jf69bidFvDSbJJLSfwVugeryaYreGPNFGXBylykr9HhoAQ5OQAL6DLs9?=
 =?iso-8859-1?Q?+KuGBfq4zQSfXCGETxQFRiAU4+yPSXOu9USDGTs5bthRZG0KUI+JcLfO+1?=
 =?iso-8859-1?Q?G8D7oCF1ofIs2KYAUxuJkqXv70FkmOg7GKbaDwJFgGZ13u3NYJJ9ND2O6j?=
 =?iso-8859-1?Q?KGjOI7asfdX1SlGgn0rfSMqdu14EYSLOt/DaH6RwoDE1peAiVbDnXlV7hx?=
 =?iso-8859-1?Q?BsG0cn/yghrsh9dI4UiMvqyQXyIbOWDXXA4ruylcOI3SJ2Z42gQr/eQWTJ?=
 =?iso-8859-1?Q?AwTVdclSy9DW9ouZTAZ8TwUVkCgIo0RLUUN6sFtQq9qkMgQ9c3Ki1IjnAa?=
 =?iso-8859-1?Q?oY/BOOw/YNxYNdeWUOZSgzqwQQ5yzPE1pusTh+ch89Fp7XfuIHo1F01Y2b?=
 =?iso-8859-1?Q?NQYNQAWvSAQcCf7dBdEPdW1pz5Plnrz9iYMQvkGQT0eJlEuVhghRN3+rXb?=
 =?iso-8859-1?Q?V+rqPbK9NsPO25tZpITYdUtvd8rsvdLln+VTEHskezsdEf5Ax0A4wU8uel?=
 =?iso-8859-1?Q?1H2JQjCTEDQFvmLO7daLAP6Q2/4tkk3r0oDxsXESCHvOZY8Pdsmi97qmO0?=
 =?iso-8859-1?Q?Xg1U7jnXoc+wH7WfuG5ZgHk3C+YrfmxELk99UEilGNOoKEHZXdGkK+2gFr?=
 =?iso-8859-1?Q?iSz7oSnflQMeMCC5Q0VN6lgcOXWMj8dDHI60s/NaBEM3kNBsp3U+qNq+Hb?=
 =?iso-8859-1?Q?TwCNaatk4nf1+1RvXboQ/ATWGNXRFZNMpVC8bpZ/YgeoJsX3xzGOos7i9S?=
 =?iso-8859-1?Q?38ZqCzGjanRjh8ebZ3h4hBh4D5ib7YUx4pWjg9FVD9dgGaHEciYf?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 071872a9-0f23-41b8-77ba-08decc7fc72d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 14:50:30.9948
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lvO13Ye4UUGNDvHI2JOAZnWO98R4jw2vJ2j9G5iBRYcOUnf0EaCXC2pMEBOA0L+Niiet8HATODrecNN+AF21s9OUqAz+4R5cy9PAyS9I7vlsB7flR5i8ZPJr1aO4i7+3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11625
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_075035_308864_D41582BD 
X-CRM114-Status: GOOD (  28.19  )
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

On Wed, Jun 17, 2026 at 11:17:43AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Concurrent regulator operations race on the shared device-level =
protection register, leading to silent hardware configuration failures.
> - [Medium] The driver module will not auto-load because it lacks a MODULE=
_ALIAS or platform_device_id table.
> - [Medium] If regmap_read or the unlock sequence fails in the guard const=
ructor, the driver proceeds with the regulator operation on locked register=
s.
> - [Low] Typo in regulator config assignment assigns dev->of_node to itsel=
f instead of rcfg.of_node.
> --
>
> commit e68081b58005a2422d441a5611dac29f8cffe2f4
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> regulator: p3h2x4x: Add driver for on-die regulators in NXP P3H2x4x i3c h=
ub
>
> The NXP P3H2x4x family integrates on-die regulators alongside I3C hub
> functionality. This driver registers the regulators using the MFD
> framework and exposes them via the regulator subsystem.
>
> > --- /dev/null
> > +++ b/drivers/regulator/p3h2840_i3c_hub_regulator.c
>
> [ ... ]
>
> > +static void p3h2x4x_reg_guard_enter(struct regulator_dev *rdev,
> > +				    struct p3h2x4x_reg_state *state)
> > +{
> > +	state->restore =3D false;
> > +
> > +	if (regmap_read(rdev->regmap,
> > +			P3H2X4X_DEV_REG_PROTECTION_CODE,
> > +			&state->orig))
> > +		return;
>
> [Severity: Medium]
> If regmap_read() fails here, the function returns early and swallows the
> error since the guard constructor returns void. Will this cause the caller
> to proceed with regulator operations on locked hardware, potentially
> resulting in silent hardware configuration failures?
>
> If the device ACKs the transaction despite ignoring the write, wouldn't
> the driver incorrectly report success to the regulator core?
>
> > +
> > +	if (state->orig !=3D P3H2X4X_REGISTERS_UNLOCK_CODE) {
> > +		regmap_write(rdev->regmap,
> > +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> > +			     P3H2X4X_REGISTERS_UNLOCK_CODE);
> > +		state->restore =3D true;
> > +	}
> > +}
> > +
> > +static void p3h2x4x_reg_guard_exit(struct regulator_dev *rdev,
> > +				   struct p3h2x4x_reg_state *state)
> > +{
> > +	if (state->restore)
> > +		regmap_write(rdev->regmap,
> > +			     P3H2X4X_DEV_REG_PROTECTION_CODE,
> > +			     state->orig);
> > +}
> > +
> > +DEFINE_LOCK_GUARD_1(p3h2x4x_reg, struct regulator_dev,
> > +		    p3h2x4x_reg_guard_enter(_T->lock, &_T->state),
> > +		    p3h2x4x_reg_guard_exit(_T->lock, &_T->state),
> > +		    struct p3h2x4x_reg_state state);
>
> [Severity: High]
> Does this guard provide mutual exclusion across the four different regula=
tors
> on the same device?
>
> The regmap lock protects individual I/O operations, but since there is no
> device-level lock held across the unlock/modify/lock sequence, can concur=
rent
> operations on different regulators interleave?

Look like make sense, need use mutex to protect this sequency.

>
> For example, could one thread re-lock the device in p3h2x4x_reg_guard_exi=
t()
> while another thread is just about to write its configuration, causing the
> hardware write to be silently ignored? Is a shared device-level mutex nee=
ded
> to serialize these sequences?
>
> [ ... ]
>
> > +static int p3h2x4x_regulator_probe(struct platform_device *pdev)
> > +{
> > +	struct p3h2x4x_dev *p3h2x4x =3D dev_get_drvdata(pdev->dev.parent);
> > +	struct p3h2x4x_regulator_dev *p3h2x4x_regulator;
> > +	struct regulator_config rcfg =3D { };
> > +	struct device *dev =3D &pdev->dev;
> > +	struct regulator_dev *rdev;
> > +	int i;
> > +
> > +	p3h2x4x_regulator =3D devm_kzalloc(dev, sizeof(*p3h2x4x_regulator), G=
FP_KERNEL);
> > +	if (!p3h2x4x_regulator)
> > +		return -ENOMEM;
> > +
> > +	platform_set_drvdata(pdev, p3h2x4x_regulator);
> > +
> > +	p3h2x4x_regulator->regmap =3D p3h2x4x->regmap;
> > +	device_set_of_node_from_dev(dev, dev->parent);
> > +
> > +	rcfg.dev =3D dev;
> > +	rcfg.dev->of_node =3D dev->of_node;
>
> [Severity: Low]
> Should this be rcfg.of_node =3D dev->of_node? Since rcfg.dev is assigned =
to dev
> on the previous line, this just assigns dev->of_node to itself.

Although it is small problem, look likes not necesary to set of_node here.
It'd better to fix it at next version.

Frank

>
> > +	rcfg.regmap =3D p3h2x4x_regulator->regmap;
> > +	rcfg.driver_data =3D p3h2x4x_regulator;
>
> [ ... ]
>
> > +static struct platform_driver p3h2x4x_regulator_driver =3D {
> > +	.driver =3D {
> > +		.name =3D "p3h2x4x-regulator",
> > +		.probe_type =3D PROBE_PREFER_ASYNCHRONOUS,
> > +	},
> > +	.probe =3D p3h2x4x_regulator_probe,
> > +};
> > +module_platform_driver(p3h2x4x_regulator_driver);
> > +
> > +MODULE_AUTHOR("Aman Kumar Pandey <aman.kumarpandey@nxp.com>");
> > +MODULE_AUTHOR("Vikash Bansal <vikash.bansal@nxp.com>");
> > +MODULE_AUTHOR("Lakshay Piplani <lakshay.piplani@nxp.com>");
> > +MODULE_DESCRIPTION("NXP P3H2X4X I3C HUB Regulator driver");
> > +MODULE_LICENSE("GPL");
>
> [Severity: Medium]
> Since the driver is registered as a platform driver with the name
> "p3h2x4x-regulator" but the module is compiled as
> "p3h2840_i3c_hub_regulator.ko", will this module fail to auto-load?
>
> Without a MODULE_ALIAS("platform:p3h2x4x-regulator") or an exported
> platform_device_id table, udev may not be able to load the module when the
> MFD core creates the child platform device.
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260617110355.15918=
44-1-lakshay.piplani@nxp.com?part=3D4

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
