Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B3A6CDB479
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Jun 2026 17:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UH4ZvYunTpuC8V/h8x2qn2u3rwRdUkOiKBeg7wV4cN0=; b=YI2L/IOgT6ZiSz
	xCKGEmaSUYDxaXirrBz08BBaDO6KQmm+iEmn/bdCE6k5bZz9XbHJ/xh7FVV5c93ViQcpMD0Rs1NBU
	acL9Npsa6ZWLHwLYGDOYnblALI+ECzcv9tznHB+dKXCx44vy2z0Iaj51A83ZKhgvA9EIsitm4QG4D
	FkC0X6VERuhcVtlsleci3sWVFuHoL9N97+iMXEiXq/U5yaJB9zBhfjsdD3vj2de9CSRR7urq0fsUO
	9A5ykPF/PVFncuTE9uajV5IdW0CrQu+jxKdLJpcwcWgyW/bdhmImMY7VICoizprVK89MH+nomRr6o
	pKdEn555AS8Zq2wTWnKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRrN-00000008C1z-1zni;
	Wed, 24 Jun 2026 17:58:01 +0000
Received: from mail-northeuropeazlp170100001.outbound.protection.outlook.com ([2a01:111:f403:c200::1] helo=DB3PR0202CU003.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcRrK-00000008C1M-0zlK
	for linux-i3c@lists.infradead.org;
	Wed, 24 Jun 2026 17:58:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RzhJjkK02sCeV5GU4k0eYKmoRcNXFqoRaqQmW9uP7D9mt4KWUZwLSpaLJbwhb9xWHZf+a8BjXffIjqRAcGRZA6eMeEAmDejFvuLL5U6eRkZTtqsbx6QAmVGIjwljS+WfOrhsZO3xtuV+fmMMpdc+A+BeEHa282LtdlHMcizY0Ij7Jin1de9GrUkZfiDnjBqOsdazG9d3VOe84C6hXJ4stNDkeGc/lyKNt8DO8gK4kJAH5ExZd5VdZmNUfpt1EAtz11RzAQ6uwwykGrqLHmfhq+h2u98eMDwx8ssXOpqZ5zn4FgKe7bDjEYcdiCVIhNFxg6aN6uJKv5v56ZM4J6fWlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYPSIkocWvhbHlYTcunK2i0YDPgy7yz4s7dXtYvAfmU=;
 b=kGKnz2hxbZ8Z9CC/3YK+KAP7UWc9Og2PeS5tNCHkuk3cvdOr56yyw8QMbudYk2cLETZDKnc/2pxJBVrTdgCtgjl2LZ7KLJyOYolhk6bkPF5hUs3SA9QtCUzJe6M/eHyALVWn342zkti2FVraP6P8AgAjxllK2+L1R+wEhWSVG7XefBnWBMNNkK7/eE3BwZk4yOfUjzUP2FwKtZT5ht0Ab1cH2imQeEBi9DJfvxtEiJ3N6Kdw9XBAHXX7aDqQvObnRI68LuN7887MUx0XdYy8LINHfZSMSFFvWiMx7jTwFsE5TKeysgRpfleAJAG9bSpbpwNJ9i9IJOk06r0sKnchcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nYPSIkocWvhbHlYTcunK2i0YDPgy7yz4s7dXtYvAfmU=;
 b=ibnEk0/dDIQKrmc24M5WyWB8gWGGz5OnyV7XsIktP6xeCALEe3HMxM5HKHjOWQ9ZzR2mhC4HIfJXQhuE6ZCyB9Usap8McGYL5gcVRqYQDbVUrsBP/5fTd3m6glhHnAzCac64Gu9KDuQpfd3hjOEGHlREQEi6GdZrQdZjNMoLpf4H6GSFoVCq3aXSL1xiWmROPU45nSfpNgtHBRSsL+kvYttTtxhmbOUv3h6buJsCkcA1njaJaTMKkMoeoZXdUDAmeEb/W/zBaELJq39GDZ7I+mVvWUZmRbgYyQrooS34+QXxWGpKnPsQGaUS7uu7Y0bG+sTTMWwVL0AulcarS7qj9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by AS8PR04MB8610.eurprd04.prod.outlook.com (2603:10a6:20b:425::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.12; Wed, 24 Jun
 2026 17:57:53 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Wed, 24 Jun 2026
 17:57:53 +0000
Date: Wed, 24 Jun 2026 13:57:46 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Akhil R <akhilrajeev@nvidia.com>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, robh@kernel.org,
	linux-i3c@lists.infradead.org, conor+dt@kernel.org,
	Frank.Li@kernel.org
Subject: Re: [PATCH v5 04/12] i3c: master: Add support for devices using
 SETAASA
Message-ID: <ajwamrU8ehBINzxq@lizhi-Precision-Tower-5810>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-5-akhilrajeev@nvidia.com>
 <20260624104326.AE6C81F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260624104326.AE6C81F000E9@smtp.kernel.org>
X-ClientProxiedBy: SA9PR13CA0075.namprd13.prod.outlook.com
 (2603:10b6:806:23::20) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|AS8PR04MB8610:EE_
X-MS-Office365-Filtering-Correlation-Id: e61a08e0-7a2f-4d7a-f3d2-08ded21a1cff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|19092799006|23010399003|366016|376014|22082099003|18002099003|56012099006|3023799007|4143699003|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info: KhdOKL46Xet4zTSQJEBPzkh8bAz6FYHBqjQOLGDFL7qvRGL41nhPBukDc/ym16EwL+J6ba+BKFaA8SwbDp3wv42Xaq9B6Jmf58zoOhllheFQZr0TlFc7NG9fK85M9wkqBtuqnqhhbTFWSaR2+Dv4KxH3sspg8URZoZXiYuL+PYwtuksr6sy80KdRGaXp6B2k6CT83s4JcV3e7lavwoPg0X7GKvkpR19OLP9NSEau6v+brUVDFLUazpk3grtJ9Gsd7tZBDC3rosAmC1fdwnhiESVt3U7L44BllTtMJBnzPeKm2aMo9MG6s0Se54ZxK6+HDh48wCLs2UzkDX4Xj34h+jlJlxzpnkryTIvviFcPUa4Y4h6MiOYneMsdYuQ06nYZMtQjxphJqUHni88yaNzVV5Ikmg2amZ8TnAGNc4NARa6PEmLKUsT6AEWJQOK84bcC1WMwU3gVbZGsWe/t5o+P+7HcChU0lBkGeLJShdUX36UEsAVr1Y3XetFGvHjwZW/rQB8c0U2lyMnkC8rLlLWwB2XAoytDagNmyYTYAdH9iA6MCRpM35rsXmtsrDI9uAKzMTqVF614n3LV8UVhgmW1cptF/Wne/BEt6ALXGZJ8h18=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(23010399003)(366016)(376014)(22082099003)(18002099003)(56012099006)(3023799007)(4143699003)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?SVXNVZUab5Mla2Zl9MMDhi0+KRakujeC8dxKLYTFjjm4UW3PfMOV91kiQV?=
 =?iso-8859-1?Q?joXc0iopBSs8TL5BqghjpbD/2+jCyhzGZWCQ5w+cksfHV//XyI0sHfKU8J?=
 =?iso-8859-1?Q?U4WvQmXqzDVRjdmH72GiYV+osnofq3zXN2S+k0mjyEUiG0/vKwSiU9kPth?=
 =?iso-8859-1?Q?Eld4ZDmFNWzE73hhNUV8c3S/Cpt4j1TYvOd1QqPOS+ysrwPCdidj7bXrMW?=
 =?iso-8859-1?Q?SB3QNUf2WrqYNln9K34BR8KtIrGhLNhJLIi510vxYsGv1XWXKhL+v22TJ1?=
 =?iso-8859-1?Q?UFQxOuazBZMiJZgSYbzHnsG0fqFVbaDuL6QiLClbpyYEqVlBC50UTfGe4B?=
 =?iso-8859-1?Q?0Jb0vr8UOoH1vSV6iJ3DRIrQjM42vcTNeypvJWycULGJ3csarMoEqV03iX?=
 =?iso-8859-1?Q?1lzYULQ+R3dlxhV70nVtaSaCklS+hxtXqSGLeDwtQgpsBGFfp6I4FUn1L8?=
 =?iso-8859-1?Q?3DILo+AWx0bt18/NzWNjOo0L1mJ+4niAbyhA/jL+hjIyxjsbvdQAbPwUDo?=
 =?iso-8859-1?Q?K7ev3Lg8XrsOTspTeg344BK3gRETlxJpsmjYJCJ7SeF1Lm7oHxnYtjH0jN?=
 =?iso-8859-1?Q?XdF61U81kw14OAB8ENZnaPBerZ2iyRs657/vAuFJ0mZnTBFTETUaxJQLKN?=
 =?iso-8859-1?Q?kEiCZlUgAQGt6gt4973uGK19+0IAzwkE3/RwpuHCCh4O/c4ePIRF1n3xRd?=
 =?iso-8859-1?Q?PWC7kb/PknQlP0AOtgvERS+J2ubRqiBXIrW2/mMDznARFXECL5dE6Q2dzd?=
 =?iso-8859-1?Q?jMXD4W6MWGIDR+vCP5jbTHuCJmXzAYJktCScPZK/VwnpyfWYCv9oJwJQPU?=
 =?iso-8859-1?Q?qGnuVhBg5bNSx9ROgEy9FbHoBautANeGTlrBPiXBZ6W82HkEmARQ8aOchp?=
 =?iso-8859-1?Q?B/yb61RHtAfiDZ3AMHjZoaoMAMSljtNQnM7uCiyq+rjDGjCNMuRwYhUDkH?=
 =?iso-8859-1?Q?ztSYw5lBwwW/4JNaPzUvNrhySYKy93+TNYVZFBWxdHLx6W0xervrhVJ20V?=
 =?iso-8859-1?Q?+wYM2S/SQp3pEfscaYg1FDKWK/As+nyDbLB1XcG3Zed4s3d8a2ZgUm4lQo?=
 =?iso-8859-1?Q?I2XvduPuZduVXbtwbUOXINC5t89k7cAtUIcQTXkyeLh7CfqjWYLOHDzcyA?=
 =?iso-8859-1?Q?088jTZ46xUcExTb+8rotNq7xO7w7KWlmbx4WfvwsA4hGdGTrLGUgVUIh5y?=
 =?iso-8859-1?Q?w0TYYfmQ7Xg+B2Pl+njfia1YC7HYDO4b+NJ54QP8GdSuEeAIDGhYw53z9o?=
 =?iso-8859-1?Q?gfRRwvW34dvPlQh4IbdqloZml4XPQAZneVn64yUMj8XGnbbRHDNUXn+y8U?=
 =?iso-8859-1?Q?X7ZTgSypisaw/m+grToA+BVaj/QetiQIDCK35dOWLuGJz7Mh6c3YeUmMk9?=
 =?iso-8859-1?Q?Z4Fa8ldFRBIzA0E0GZeFU9YT9cFO3+aKh/IBJV4peKURGapQbSkAwzA6xI?=
 =?iso-8859-1?Q?i8c7NXCF+IMICW3pT28Dgc22e78WP8d5VZ2HMt45tg2kApEGxJW51JlbAO?=
 =?iso-8859-1?Q?9Vy7NdR52qYoNck8sa17s8Ue4xsotPxhSOFVHpvQ1+NzFOSwHiElNChmxT?=
 =?iso-8859-1?Q?x32beW/XWmgr9kff2rceBbvJyjAbDWX63/b21EAv5o/HHZVU/2O2Pa8rxt?=
 =?iso-8859-1?Q?uwOEhAv8GGzjV2t0trgScXHdWF+9UGos9ToNoZRb3aW8NeKXU1xX1lATb9?=
 =?iso-8859-1?Q?bf2T4cKtJUxNFESxHTPEZcHlRikT9BUtO8E26axFHOgtnjpnQNLnx4ltZO?=
 =?iso-8859-1?Q?BofaKZPlh/EG12lkhYzm6lWDF+DuICiWQR8CVJuPelLqzAqzdNJOVeEfTQ?=
 =?iso-8859-1?Q?wE+W1ZzJnKRadI8F1gKk5tO72u7s+ow=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e61a08e0-7a2f-4d7a-f3d2-08ded21a1cff
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2026 17:57:53.3902
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaD6A/CVLMATgre1Hu2JSqJhEDbs8MBULeHXB+gcxZtVUdqdjTm8b+Nm+IYoDYfNEeIJCy+4OUdhUfrNsj8Q78vsUgha36HaRNyys3Yxns6+1e539XJN8/1KBtF+JLFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8610
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_105758_457149_F52EDA7C 
X-CRM114-Status: GOOD (  37.65  )
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

On Wed, Jun 24, 2026 at 10:43:26AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issu=
e(s) to consider:
>
> New issues:
> - [High] SETAASA broadcast is sent before SETDASA direct assignments, whi=
ch breaks initialization for devices that natively support SETAASA but are =
configured for SETDASA.
>
> Pre-existing issues:
> - [High] Missing RSTDAA on error path due to premature address slot clear=
ing leads to bus address collision.
> - [High] Double free and Use-After-Free of `desc->dev` when `device_regis=
ter()` fails.
> --
>
> commit 08b7cd00b36fcaa4fe6292af27e273df6dc64b5a
> Author: Akhil R <akhilrajeev@nvidia.com>
>
> i3c: master: Add support for devices using SETAASA
>
> Add support for devices using SETAASA attached to DDR5 memory modules that
> do not support ENTDAA. Devices using SETAASA assign their pre-defined sta=
tic
> addresses as dynamic addresses during DAA.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 4bba2bad897a7..3deae8cdae525 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
>
> [ ... ]
>
> > @@ -1878,6 +1924,22 @@ static int i3c_master_early_i3c_dev_add(struct i=
3c_master_controller *master,
> >  	if (ret)
> >  		goto err_free_dev;
> >
> > +	/*
> > +	 * For devices using SETAASA instead of ENTDAA, the address is static=
ally
> > +	 * assigned. Update the dynamic address to the provided static addres=
s.
> > +	 * Reattach the I3C device after updating the dynamic address with th=
e same
> > +	 * static address. It is not mandatory for such devices to implement =
CCC
> > +	 * commands like GETPID, GETDCR etc. Hence, we can return after reatt=
aching.
> > +	 */
> > +	if (i3cdev->boardinfo->static_addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		i3cdev->info.dyn_addr =3D i3cdev->boardinfo->static_addr;
> > +		ret =3D i3c_master_reattach_i3c_dev_locked(i3cdev, 0);
> > +		if (ret)
> > +			goto err_rstdaa;
> > +
> > +		return 0;
> > +	}
> > +
>
> [Severity: High]
> This is a pre-existing issue, but missing RSTDAA on the error path due to
> premature address slot clearing can lead to bus address collisions.
>
> In i3c_master_early_i3c_dev_add(), the driver assigns the dynamic address
> with SETDASA and reattaches the device. If reattaching fails, the error
> path internally calls i3c_master_put_i3c_addrs(), which clears the
> init_dyn_addr slot status back to I3C_ADDR_SLOT_FREE.
>
> When the code jumps to err_rstdaa:
>
> err_rstdaa:
> 	i3c_master_rstdaa_locked(master, i3cdev->boardinfo->init_dyn_addr);
>
> It calls i3c_master_rstdaa_locked() to reset the device's dynamic address.
> However, i3c_master_rstdaa_locked() verifies the slot status:
>
> drivers/i3c/master.c:i3c_master_rstdaa_locked() {
>     ...
> 	if (addr !=3D I3C_BROADCAST_ADDR && addrstat !=3D I3C_ADDR_SLOT_I3C_DEV)
> 		return -EINVAL;
>     ...
> }
>
> Because the slot was just freed, the function silently returns without
> sending the RSTDAA CCC command.
>
> Will this allow the hardware device to continue squatting on the dynamic
> address while the master considers the slot free, causing collisions late=
r?
>
> >  	ret =3D i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> >  					i3cdev->boardinfo->init_dyn_addr);
>
> [ ... ]
>
> > @@ -2232,6 +2294,12 @@ static int i3c_master_bus_init(struct i3c_master=
_controller *master)
> >  	if (ret)
> >  		goto err_bus_cleanup;
> >
> > +	if (master->addr_method & I3C_ADDR_METHOD_SETAASA) {
> > +		ret =3D i3c_master_setaasa_locked(master);
> > +		if (ret)
> > +			goto err_bus_cleanup;
> > +	}
> > +
>
> [Severity: High]
> Is it possible that sending the SETAASA broadcast before direct SETDASA
> assignments breaks initialization for devices that natively support SETAA=
SA
> but are configured for SETDASA?
>
> According to the I3C specification, any device on the bus natively suppor=
ting
> SETAASA will respond to this broadcast by adopting its static address as =
its
> dynamic address.
>
> After this broadcast, the driver iterates through devices and attempts to
> assign custom dynamic addresses via direct SETDASA commands:
>
> drivers/i3c/master.c:i3c_master_early_i3c_dev_add() {
>     ...
> 	ret =3D i3c_master_setdasa_locked(master, i3cdev->info.static_addr,
> 					i3cdev->boardinfo->init_dyn_addr);
>     ...
> }
>
> Since the target device already adopted its dynamic address during the
> SETAASA broadcast, it is no longer in the unassigned state and will NACK
> the subsequent SETDASA command.

Look like correct, but I am not sure if target will NACK SETDASA. Or should
use SETNEWDA for SETAASA method.

Frank

>
> Could this cause device initialization to abort entirely?
>
> Should SETDASA direct assignments be executed before broadcasting SETAASA?
>
> >  	/*
> >  	 * Reserve init_dyn_addr first, and then try to pre-assign dynamic
> >  	 * address and retrieve device information if needed.
>
> [ ... ]
>
> [Severity: High]
> This isn't a bug introduced by this patch, but there is a potential double
> free and use-after-free of desc->dev when device_register() fails.
>
> In i3c_master_register_new_i3c_devs(), if device_register() fails,
> put_device() is called:
>
> drivers/i3c/master.c:i3c_master_register_new_i3c_devs() {
>     ...
> 	ret =3D device_register(&desc->dev->dev);
> 	if (ret) {
> 		dev_err(&master->dev, "Failed to add I3C device (err =3D %d)\n", ret);
> 		put_device(&desc->dev->dev);
> 	}
>     ...
> }
>
> This drops the reference count to 0 and triggers i3c_device_release(), wh=
ich
> frees desc->dev via kfree(i3cdev). However, the pointer desc->dev is not =
set
> to NULL and remains dangling in the master->bus.devs.i3c list.
>
> Later, when the master module is unloaded or unregistered, the cleanup
> iterates over the list:
>
> drivers/i3c/master.c:i3c_master_unregister_i3c_devs() {
>     ...
> 		if (!i3cdev->dev)
> 			continue;
>
> 		i3cdev->dev->desc =3D NULL;
> 		if (device_is_registered(&i3cdev->dev->dev))
> 			device_unregister(&i3cdev->dev->dev);
> 		else
> 			put_device(&i3cdev->dev->dev);
> 		i3cdev->dev =3D NULL;
>     ...
> }
>
> Because i3cdev->dev is a dangling pointer, the check passes. This leads to
> writing to i3cdev->dev->desc (use-after-free) and calling put_device() ag=
ain
> (double free).
>
> Could we set desc->dev to NULL after put_device() in the registration err=
or
> path?
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260624102153.17700=
72-1-akhilrajeev@nvidia.com?part=3D4

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
