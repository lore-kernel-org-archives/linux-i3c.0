Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81D0ACD98CE
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Jun 2026 19:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EEFBiSAaBY7/xmrp4gCcgh9u1FVDoeRhLGNeTXKuRes=; b=Ro2hYOvFB6P3F+
	bgMjAFyFxCCtyWAu4ffQpJjn6KU7bXTZsY6sumAVq0LQ+63wqajH/1gczxViMBp4tPPVY1PQLTQCg
	l3xQyMz7dHrlwiJpDMCmnX11TqFym5zhHlmRZAkWZ/eiiHgcuBwj4KSXgmIZ6dZxm2I8F6QckYTrM
	nE6PhvZiA7iPA0+J8EGaO4TjXr5QOJ8Nv57yWWev1LFirtGeciNsytC+ritKmpp1PyXYjAbqQjuyL
	YjNLv/ZZ7DkJo2fpws6TZIkewipDXGb/3k63YXzC5gaLC/ILssUCqcx/ErpmXdzaLGPO1tMoWzucI
	WuWpkCl+NaWlhhkTMhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7wL-0000000BVUO-19K2;
	Fri, 12 Jun 2026 19:53:17 +0000
Received: from mail-swedencentralazlp170130007.outbound.protection.outlook.com ([2a01:111:f403:c202::7] helo=GVXPR05CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY7wI-0000000BVTs-1rpb
	for linux-i3c@lists.infradead.org;
	Fri, 12 Jun 2026 19:53:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YWfqIm1Xd62Jkz+tHQWYWSH8ZxpHnpGfnnzY55Q9Y8yn9sKVdElHI+qBSBSNSyW7QR29qY05BTL+3stK/pu/nx3NE8Otdxl51YGjTk/kZQ10hfQ16/zXwOVW+1KGT7SlSbAv7IkIJzHjYU4gO5u8iFItg0lo2kqSJXu/YgNUE2k+RtsJEUzc1kFrK1u7ZITiVc3NYcb+typoIFxxUgFePbSL8J1FpsUEilb176T+SnZW20MKkHXCXn1RShui+AbINYQGgu5EtoSKAilF3gL+R+6k1EuDSXCJh2dsyjcAY4ag/7qGhY5nRoJPuxH3OGT4TAwoBmXbMtoIaWdqp783Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o1h0AdBXO/DEQYZDBYvSTR8P3qm56mOQvITD95wdxvg=;
 b=UDxMv0/b5Rb21HAgr4VvEEQYcy2pPCyyVJWKEQf4gwxzG82xb+Z786fgkhImpWXwQdcSDXvMpU8KVfwgZEca/+4W7SrcRPdC5TBYF9TpVOwPdss9GSMBeSg8sP3whljQIl+YV3oIbJTFEjqinchcihXRuy2TUdygHKG5TYMVvjk+xwGbQut3ug/v9sdNM+sL+BIwhzsWbdTzxhMhLm735czd58y0aaTi2NWNPHSSnfkI2RRW1A9Rz799Tqcb5jHyygL++s76tsMNU3KG8KuhOCPOJj6ve9/j0usYz8gCAOguADUq8pquJlhLGcoajG7XCAf5F5jWROylhHU06rSgog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o1h0AdBXO/DEQYZDBYvSTR8P3qm56mOQvITD95wdxvg=;
 b=YjzcsZpzGW77apFGVDVKrF4cRZ55LG1bE0eeoHDIi1cRHTU2rdebe22MIjwTZTNTeByOadl8M8hRNyjbCdjVsNviy8svAgsHXbqUcx7cTQOzlcWg9dPFFkckkl/2pTAMGlbZWA6VeSwcHCAs3YVhLTAfURo4TK/YecqnEzGSV1px1SB1+hxd3iwfs0D9yAyLU2NkX9WGz8bzvHSofYr7ZOqCwEW7w5teisUGWEmNgZGu242te+nAWrn0xclupj787PSXz1C1+TCtb28fEwLb4JLhGA9Zg2tSH7Y4tpk3ip1kzZtTnyur9B5iEG31z8ctKK+VoHJNUkITmkELhb0FRA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV1PR04MB10306.eurprd04.prod.outlook.com (2603:10a6:150:1c9::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.15; Fri, 12 Jun
 2026 19:53:06 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0113.013; Fri, 12 Jun 2026
 19:53:05 +0000
Date: Fri, 12 Jun 2026 15:52:59 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Lakshay Piplani <lakshay.piplani@nxp.com>, devicetree@vger.kernel.org,
	Frank.Li@kernel.org, linux-i3c@lists.infradead.org,
	conor+dt@kernel.org, robh@kernel.org
Subject: Re: [PATCH v11 2/9] i3c: master: Expose the APIs to support I3C hub
Message-ID: <aixjm9eImJhrUU2O@lizhi-Precision-Tower-5810>
References: <20260612111816.3688240-3-lakshay.piplani@nxp.com>
 <20260612114421.2BEE31F000E9@smtp.kernel.org>
Content-Disposition: inline
In-Reply-To: <20260612114421.2BEE31F000E9@smtp.kernel.org>
X-ClientProxiedBy: SN6PR2101CA0014.namprd21.prod.outlook.com
 (2603:10b6:805:106::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV1PR04MB10306:EE_
X-MS-Office365-Filtering-Correlation-Id: 76a52d0d-2de2-42b8-4bcd-08dec8bc3817
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|19092799006|23010399003|366016|3023799007|22082099003|18002099003|6133799003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: 8M8ZUWGgEj2EReM1c1g2b0YOKRGIjBKuhZrFsjX9BCUgNgf6i1KTvt09c+BNzFqNjixFOpB5jomvlmB8gWn6Pr++PyAhtVoByuvYZUmfsIHK4q1e6MHAxPboaHP1t6j81IDzw15nIMKEmYBNcd8P0VxSbTcwUzIFcHtReFEJjHLwvzulJCNXHa/ZMMK4MliSnEdOgxlAhYkkc8p8AWTE+U3WjJQKi1Z0dEJ2PsR5aHr6whHQ9nua3olDWv0RIuQFHuBzerJrg9/jyHP4HsRpKGPocDMXxDfAu6DCo29gEJoRC0V+Tzh2+qhQGIE/mB307hVsmlCPEPQcofu8qlWF+cbAPhJMDzztpVpPk1kAoQg/cQsrlDKSprn2yx4n2SzAf7gZSoAc1izIbzRqrorkL51/Y9eBJLr8S41bw0sUpRNu8JG0vVD5KIsr1zxFySNMNoWFXRVacsJuS0618EHrR71JugQGpYBtoIJBxytispPpHiHLGPzMGVzd4URq5PBsk4/RM95fkZ2sl2E52o3+AyPJHmQxnctxFjdRlkXXDPnQcfEnnroT1hbxXIUDfALr8aHXRrbErKKptdIpBr9mICtn0N4NpE9pyArgzdGoGkBhE4oOycb4Sf6BvI3WoobcSWuH+E7GhzzmMQkVk7S66A==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(23010399003)(366016)(3023799007)(22082099003)(18002099003)(6133799003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?5W87FbM5G0yZrCZ0As4PJvm6bDJAQ3JijjMPXCgrTCya0hTBx5JAV3yBet?=
 =?iso-8859-1?Q?7Y1APimxBL6SxImlBqcwj69YBXBWmjrxKYbXNkE2crTqgnTno6VuGWr9KS?=
 =?iso-8859-1?Q?goM8fNKculd/hUKG8YNcOQ/sZnh1i7preb8ebM0MMH+WKYR6du7HURABrm?=
 =?iso-8859-1?Q?xnkJshLBYAXL10YyBIdpiBdfcl4QzLTxsDzl7A5SXpQMWbaDwvswRJp4lr?=
 =?iso-8859-1?Q?ifFY2nqvowgKnfQc2eSxY0sYsgEV4VAPKNz2NjiSA5dEcdyQr8ZFoF1Ng5?=
 =?iso-8859-1?Q?GvohfU/HaErZeID/FMyzSnX+gU5TYpxE2FnIuFjTRjq5LRS4FrAIp10YQI?=
 =?iso-8859-1?Q?SYYMg5YVpn0h0SoY5Afp6YL9Ywx5NW4eDvaHl5vYefjhDorRt6i8hNWIQ2?=
 =?iso-8859-1?Q?QxNnK44dubJ1yGeQ8xMZ3wGcHzyGeDfWg4tVRPsTadOCOINL1faWrXQVHI?=
 =?iso-8859-1?Q?uH6pJniPrq4jSnBmEYvcgF9UDhHDH7s0IPAL0tf7IPDRdpvMeovBvP8H+d?=
 =?iso-8859-1?Q?WV9hWAiVL/BU5PV+cQe52C2s1FrrCVnRm5WkKeqHgQdfdJclRQJsB1zdbX?=
 =?iso-8859-1?Q?UQVH8MFwJbWcml6Kn5gi90zFz+UsSgsDgt9Bxem0DhWVKDYislnPMU9IC9?=
 =?iso-8859-1?Q?ZfVKPY9AIXFxE5xrxhhJH5XtCE3P7Zh5wyUJTd7uKHSu5pOjDgVTQpnsT8?=
 =?iso-8859-1?Q?2FHBAHlP0vlqMQMJC09deaFdvWoFjrBTVh6Hle/ydSYwJ2nXrZ7Aufz13+?=
 =?iso-8859-1?Q?Bi55EntUckw78I+Wd9RZ/yNafKHVYHe7j/odSweK5kYHvx51zg3rcBIMu3?=
 =?iso-8859-1?Q?Ai1OtrUzIYdXktG5lyprWdNJL85QGIOSP5D1B14Obgzt91DH5KUQx1XBo8?=
 =?iso-8859-1?Q?w4QpoDd0MTniDfYi6BMHKegTH6K2zqv26QlRiea5pBIW+5TeAIVvDuXfBy?=
 =?iso-8859-1?Q?p7rEg+5bDhVeOsXTyNj9U6b8rjbHCkWvka4swG4q/uq5DL5HUGCYIyivjz?=
 =?iso-8859-1?Q?t6/xy24s95I3/oWfqKCL2fFuNpD3FFWk5cAJceXUWdZmYi+JDL1jjWm5+W?=
 =?iso-8859-1?Q?z4QQt/LZryN/u5neSlcNiKKVvZ/ZZu8c1GpnqO8ge3Ce5CaBvgDgnWX/Ti?=
 =?iso-8859-1?Q?WlZOlT1jtRh9PR2/g7v7nWwCXNhSKZ8W0TOsbQaiz4EKtL5p0IWvMIAwBt?=
 =?iso-8859-1?Q?rmUhVf/6xF1h5/vSzvaxiUk7HVKj/D0/Loj4fym0iC6seEKi5AYWZ7bbXm?=
 =?iso-8859-1?Q?hPBqMj+c0H+X2XYrCRgDdTBT6EQDtQzt3uqRuBgkbi+V+7uBBpC/y2o1xf?=
 =?iso-8859-1?Q?C9e/KD+vjf+zJn9sN1X3aNOItitT9hH8liCPSO5nKGKBRGWEQ4XFsBL33n?=
 =?iso-8859-1?Q?dZ3MGFQ8LVCaXnr/tn9DVwZsJ0civZaaLrmKNswfC/oMGycZH3xqHsmh10?=
 =?iso-8859-1?Q?2tiLDkhHbJxrGBTlP3zr5+w2NjCWwjEKW+BTD6sCbb3n5U8bUAzew9Yqjs?=
 =?iso-8859-1?Q?WbRbCP2xmhxwgDxktbVdcSHQb0SoCm0N1cHK/lVoUpinRsJ3HyxdX9qn8w?=
 =?iso-8859-1?Q?rnAfCZBkQHbqLKkW+5qr0rlMrutvfhnf5+E6i4WJnrvJ7y0KE4ohsAe+pY?=
 =?iso-8859-1?Q?T3OLn+uFrkSBHvisykeZ7nT8LEY8aClon7ePp0x4ddshey64WYZYrDAaoh?=
 =?iso-8859-1?Q?5WRVYMtWrn4MSFvq4hTMyg3idB8tOEXA8WKJOJCg95LopDtG4E7lNf3ih1?=
 =?iso-8859-1?Q?SX+HaqhHolyfcIomkzB5y7OVVdcke7B3VpOGObTK7L0GhCn9tydSaaz0o8?=
 =?iso-8859-1?Q?ACPvfLtV2s5CYeILJxzIrUFZt/+AdF74SBbuUJyTtO7rFLkHSANr?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76a52d0d-2de2-42b8-4bcd-08dec8bc3817
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2026 19:53:05.7609
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wZGs9V1R6VGZPqSfSAgnA9MYZT+rz6C3/9YWAQ4cScc3y136yTM5Wcrrk0UHRBp/6mort1PqERdPuOqKUzSPlAHg0M+VeGW4b+oEFvHmB6ldI7jaeFHNR4aaia/dwX5M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10306
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_125314_489972_03B50255 
X-CRM114-Status: GOOD (  36.72  )
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

On Fri, Jun 12, 2026 at 11:44:20AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> New issues:
> - [Medium] API documentation mismatch: i3c_master_reattach_i3c_dev_locked=
() claims to return -EBUSY on collision, but unconditionally overwrites slo=
t status.
> - [Low] Invalid lock context expressions and typos in newly added IBI ker=
nel-doc.
>
> Pre-existing issues:
> - [Critical] Multiple Use-After-Free vulnerabilities in i3c_dev_free_ibi_=
locked() due to improper synchronization and teardown order.
> - [High] Unbalanced release of address slots in i3c_master_reattach_i3c_d=
ev_locked() failure path leads to bus corruption.
> --
>
> commit 13a1ff5c64b48ceff03545ae3bebd5e60a136c1e
> Author: Aman Kumar Pandey <aman.kumarpandey@nxp.com>
>
> i3c: master: Expose the APIs to support I3C hub
>
> This patch exposes several internal I3C master functions to allow new I3C
> hub drivers to use them. It adds kernel-doc comments and exports symbols
> like i3c_master_reattach_i3c_dev_locked and various IBI handling function=
s.
>
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index c45b450af319d..ec3547f75469e 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -1652,8 +1652,23 @@ static int i3c_master_attach_i3c_dev(struct i3c_=
master_controller *master,
> >  	return 0;
> >  }
> >
> > -static int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> > -					      u8 old_dyn_addr)
> > +/**
> > + * i3c_master_reattach_i3c_dev_locked() - reattach an I3C device with =
a new address
> > + * @dev: I3C device descriptor to reattach
> > + * @old_dyn_addr: previous dynamic address of the device
> > + *
> > + * This function reattaches an existing I3C device to the bus when its=
 dynamic
> > + * address has changed. It updates the bus address slot status accordi=
ngly:
> > + * - Marks the new dynamic address as occupied by an I3C device.
> > + * - Frees the old dynamic address slot if applicable.
> > + *
> > + * This function must be called with the bus lock held in write mode.
> > + *
> > + * Return: 0 on success, or a negative error code if reattachment fails
> > + *         (e.g. -EBUSY if the new address slot is not free).
> > + */
> > +int i3c_master_reattach_i3c_dev_locked(struct i3c_dev_desc *dev,
> > +				       u8 old_dyn_addr)
> >  {
>
> [Severity: Medium]
> The kernel-doc states this returns -EBUSY if the new address slot is not =
free,
> but does the implementation actually check this?
>
> Looking at the rest of i3c_master_reattach_i3c_dev_locked(), it appears
> i3c_bus_set_addr_slot_status() is called unconditionally to set
> I3C_ADDR_SLOT_I3C_DEV without first checking if the slot is available.
>
> Could this silently overwrite an existing occupied slot if an external dr=
iver
> relies on the documented failure behavior?
>
> [Severity: High]
> This is a pre-existing issue, but does the error path safely handle a fai=
lure
> from master->ops->reattach_i3c_dev()?
>
> When the reattach operation fails, i3c_master_put_i3c_addrs(dev) is calle=
d,
> which marks the address slots as free. However, it doesn't appear to reve=
rt
> the hardware device's assigned address.
>
> Since callers like i3c_master_add_i3c_dev_locked() completely ignore the
> return value of this function, could this leave the bus manager out of sy=
nc
> with the hardware state and cause severe address collisions if the slot is
> subsequently reassigned?
>
> [ ... ]
>
> > @@ -3195,6 +3211,16 @@ int i3c_dev_do_xfers_locked(struct i3c_dev_desc =
*dev, struct i3c_xfer *xfers,
> >  	return master->ops->i3c_xfers(dev, xfers, nxfers, mode);
> >  }
> >
> > +/**
> > + * i3c_dev_disable_ibi_locked() - Disable IBIs coming from a specific =
device
> > + * @dev: device on which IBIs should be disabled
> > + *
> > + * This function disable IBIs coming from a specific device and wait f=
or
> > + * all pending IBIs to be processed.
> > + *
> > + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> > + * Return: 0 in case of success, a negative error core otherwise.
> > + */
>
> [Severity: Low]
> Is the lock context expression correct here?
>
> The parameter is of type struct i3c_dev_desc, which does not have a desc
> member, so &dev->desc->ibi_lock appears to be structurally invalid.
> Should this be &dev->ibi_lock instead?

Make sense, please fix it

>
> Also, there is a minor typo: "error core" should likely be "error code".

Please this typo

Frank
>
> [ ... ]
>
> > +/**
> > + * i3c_dev_free_ibi_locked() - Free all resources needed for IBI handl=
ing
> > + * @dev: device on which you want to release IBI resources
> > + *
> > + * This function is responsible for de-allocating resources previously
> > + * allocated by i3c_device_request_ibi(). It should be called after di=
sabling
> > + * IBIs with i3c_device_disable_ibi().
> > + *
> > + * Context: Must be called with mutex_lock(&dev->desc->ibi_lock) held.
> > + */
> >  void i3c_dev_free_ibi_locked(struct i3c_dev_desc *dev)
>
> [Severity: Critical]
> This is a pre-existing issue, but does this teardown order introduce a
> use-after-free regression when exposed to external drivers?
>
> Looking at the body of i3c_dev_free_ibi_locked(), the function calls
> master->ops->free_ibi(dev) before destroy_workqueue(dev->ibi->wq).
>
> If free_ibi() frees the underlying IBI pool memory, and destroy_workqueue=
()
> subsequently flushes pending async work items, could those work items
> execute and dereference the already freed pool?
>
> Additionally, if i3c_dev_disable_ibi_locked() had failed to disable the
> hardware interrupt, could a firing interrupt access dev->ibi after it is
> unconditionally freed by kfree(dev->ibi) at the end of this function?
>
> >  {
> >  	struct i3c_master_controller *master =3D i3c_dev_get_master(dev);
> > @@ -3301,6 +3366,7 @@ void i3c_dev_free_ibi_locked(struct i3c_dev_desc =
*dev)
> >  	kfree(dev->ibi);
> >  	dev->ibi =3D NULL;
> >  }
> > +EXPORT_SYMBOL_GPL(i3c_dev_free_ibi_locked);
>
> --
> Sashiko AI review =B7 https://sashiko.dev/#/patchset/20260612111816.36882=
40-1-lakshay.piplani@nxp.com?part=3D2

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
