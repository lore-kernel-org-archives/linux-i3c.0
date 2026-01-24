Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2EBD715C1
	for <linux-i3c@archiver.kernel.org>; Sat, 24 Jan 2026 05:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dP/A/oKIw0rv9HhkA9+A5L06RThCIrpspMueJiPspS4=; b=yP5kG2hFuC1KDr
	3KbmAPilrLRK2dCEOtkTP8EM5yfbjlQx2mdsH5pxCclB0vJiuTnr+9YNrkUIOAiUJVeqjqvkFODWQ
	rM0TwvckbrRO3heRQ2yGQEMf4xaVh9ETCA5q7XTOZiXAQUHYWHNUssIOpSafl9G070tB+XrcXBF2c
	hSsxYRaSgHTtvOe+GIKQ/FIBZjUSDZA4et367e1Aa0cx9o2lQUR5Pfqs0hKxMq7CfUU0LbYkueGu6
	yIQhBfZhBxV+BOwGPbUrVqfqh1MUhzc83J8XtRomApGltywiLsAyLObIN1PKunGGdsMcNrT8enj/b
	iLlmXwtFxRkyXsGYibmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjW4O-0000000A0l1-1PGb;
	Sat, 24 Jan 2026 05:20:24 +0000
Received: from mail-bjschn02on2095.outbound.protection.partner.outlook.cn ([139.219.17.95] helo=CHN02-BJS-obe.outbound.protection.partner.outlook.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjW4K-0000000A0kS-3YIx
	for linux-i3c@lists.infradead.org;
	Sat, 24 Jan 2026 05:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oTMFLjjMB/uVi+HLGWt86xgMXo0OGrIs4sVLyA9g7Dd/PNCJmicqPOpXKkPPUj3oFaPKlTYxagenGvnKMSx4VXznzY5QQUuY8rwSvBUUXdQ5VRC8X37TmgjboJePbyS9sfeTyh6W9R+IVTybr1DLamYn24FphIh0p1oFEpNAW1TrZr7DfSqE7qR3LrjR85PgLMsG9h/1KYGHuhk9XCuLuNr3jFQW5jty18nlLL09oTnoCBZUecuDZZexBRG7D2GKLWDxN6FxpL/Rzvg295/w+9O0Is7chZi2HRWogfAZC4oJfRWYlli95t/00lfA6+836OXKqhH4k8otpsmWl2Uc3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d2rmieu2qdz8rOQjgw4Pr7FJLLdxXosT+X8VE9nS/aU=;
 b=EGWSvqMhRFzOnpXbqDyFI3NQnwWjyFrUieO6Dz//EaUuugFPxrsysyVOQYIW+oZUq6hHvqeghgUNb05DheTquJ5VGyzgi3Qh9wHA/RllwaldsCOQOxxfGItqfTQj2BQs6uOqYmYi182iAe5Aiv+6PJwf2ublcanhm4XrIY3lOibMWaRjmt7GxlrMtIHDvk548wGioLCgtBvEBaLggZvj3rQ60VbuWWB1yw/eljGymvwe4twmrNmSR5xLpkQApqxrHs1U99segrvChqPPM+wu9XXXrcbgLgFLYMa62SudAmafpyFZBxy4mzVtJEVRSrgZys3M8Xb2WyiRzpjKyOm7iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:20::14) by SH0PR01MB0681.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:21::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.10; Sat, 24 Jan
 2026 05:19:57 +0000
Received: from SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18]) by SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
 ([fe80::81c4:2724:6a48:a18%6]) with mapi id 15.20.9520.009; Sat, 24 Jan 2026
 05:19:57 +0000
From: Joshua Yeong <joshua.yeong@starfivetech.com>
To: Frank Li <Frank.li@nxp.com>
CC: =?iso-8859-1?Q?David_Nystr=F6m?= <david.nystrom@est.tech>, Alexandre
 Belloni <alexandre.belloni@bootlin.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
Thread-Topic: [PATCH v2] i3c: master: Add sysfs option to rescan bus.
Thread-Index: AQHci8jXfC4fs9k2SESU1S7V+9LN2LVee9dAgAGsHICAAKIvMA==
Date: Sat, 24 Jan 2026 05:19:57 +0000
Message-ID: <SH0PR01MB08413FF4A5EDBFBF928A0B97F9952@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
References: <20260122-i3c_rescan-v2-1-84c74a483f03@est.tech>
 <SH0PR01MB0841E47B510DB5EFB48B3460F9972@SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn>
 <aXPOD/klC4W/aUbs@lizhi-Precision-Tower-5810>
In-Reply-To: <aXPOD/klC4W/aUbs@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SH0PR01MB0841:EE_|SH0PR01MB0681:EE_
x-ms-office365-filtering-correlation-id: 7bc5d53d-7c30-458c-3671-08de5b083711
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: kXprjGp8Qno2VtE/e3PhLZKSfMhI2MMZxT1YuXP1ujHonXDVvCUpQB5p9jXWbKF+tR5LiU07xy0kiWMKG5o4uLfiwgRMiupVBFcWeS0cv+dxeAQ0BdFtTuLmrtO55A74+OPTM8HpN5rONibMjNs50BLLvNVoJukzDeV5IBdKRAyEelqjRilfOnPTRuJywoBQ+0d7fryjzlKCnZOjsGYbThO2iSIiSqyavew7QMbmXpTfu9gDNwZR1Xxn4akUjqf4gRWy8H2zwAhsZ3SLZu9ofJxMmSokWqA4fWaqvKc3B3G6cygLbz0IPi/Aq6MyPJHbzsZ5hGKwDgdagj6ByY4OOR+u2QHW/fFiGTpxmv6FR7GLD4ih+9/BwCmIxCaEobGwZJVEFIvcgd1uLlHwMtH72GqdbCUmrJpQ3nEnqUfO7eKKQwJ6LLj9QysdLTxh8ZmZBYFiTcjoChHE8TbYaD3iQ7J4a4nzOvBLMuzdmP7DMypo+IuDMj68ndvLn2WIPXOexuenKS4wWvezf8Y/8b20ZdXrADzauKeHZ9TThMAEUi9l295YqXODwKwlQh43whcH6a+AH6N12c2LOm/TyoP1rMLrLtzyNtICOqjOdgho9hk=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?KGTrtJVqa2O/IhokXXt03D4sMchZjp3VPPj3q1G8UxNPX+mdYVUtbaurAS?=
 =?iso-8859-1?Q?9nNvelCNJ7ETiHxvwDXKA++E85ECbIP5zWxE+wPLnErT8RRa6tybgd+AJY?=
 =?iso-8859-1?Q?PYfCGXn4kE5bmO9UX6SEFjTXiHGjX7TNbgEPjWghMYZkFlUnHjmqQrhCZg?=
 =?iso-8859-1?Q?MJZaP1TZKG1kHBoC+R8fC3qid5a8clbzMQm87o21uRnX/woDF1qtP2ctu4?=
 =?iso-8859-1?Q?4CqKRRun/mbgJgXCOgLNVTFr1SLBGedBEfewwceRC2M+m33s7fNj4/v4E/?=
 =?iso-8859-1?Q?QfK1Txz+rSetKjQ+3TMwUu4HAEJ2MTeM68RH4QMywj7HjD1TBTELXNbW7i?=
 =?iso-8859-1?Q?82WcujUlqIOHmayot0pJqiPevPsptDswfPxZwv6fLQga6/KLR9LRx4k+57?=
 =?iso-8859-1?Q?LKAhMW27KH9BFGHrZhWmaR/4EM8Usft9HvjMlnTYEk89MLpCts58b3Kww5?=
 =?iso-8859-1?Q?F/eCu5ogRacJWDty86hw0XluvluuJG+DT6VGTjT61zGSYcyqtRfXuDp6JH?=
 =?iso-8859-1?Q?sP3pVk28Qzst4Rb2IcVLNc+qI1E4E81SJCE9agDxbNexgC4+GYBl0mXMYR?=
 =?iso-8859-1?Q?asO9dPffGsynfibZnCrhvMjW5ypSmn8hJrfDTFaUJgz/p1RFCfXJjhZIhp?=
 =?iso-8859-1?Q?oyUIAT2J9qvSDA+N5wkBvXldei5wf4bV0f5dYUU4MFSembLMPQnOkpTupr?=
 =?iso-8859-1?Q?t/rA6c4Davq4oto+ZhFtYF97FEJoNHbw2r0Vy6fiZr8aI0WW+mQBdIBFCB?=
 =?iso-8859-1?Q?jHK55vohco4No9ZZ6f2ZWDzQzzoHm9+5gPgJKjQoc3yAK4aEFyTIUGF6Yh?=
 =?iso-8859-1?Q?sIqY3wBFd+I9ETI3R/NqIdA+FKIQQ38OJKqirtqbzrs7gz37T+bEwKczbe?=
 =?iso-8859-1?Q?IsZpK4Ip/ulckaYgD4Hz518VqejcU39uXw5ZbqDU4vMd0+PZkXQj3Jd8Xr?=
 =?iso-8859-1?Q?574xv8UuOUTgA0ZpmNwnpVPu+K+iBwiMCGAGVw/Xoz9YUu688yTpQYO43a?=
 =?iso-8859-1?Q?Z3+tS0/oPlIVfS8GyzHm/2UMJy0eYCiQp5Ab4uabAlZiXL70xQkBFReqFn?=
 =?iso-8859-1?Q?H60FHD+5zFc/MmPC1IgyFfL9BGng8Nd2yVi1vjZh5BJXGTFuKXckqU2RIv?=
 =?iso-8859-1?Q?162oKQTSSAaiAie92SodKemDEYlScvD2GSBG7xZsl3j+fP8UZTLomkKUhf?=
 =?iso-8859-1?Q?h43+2H6DOjCeoiXqlzMXmCukyKfFUuaqEar+FQU+Kq1PTPfxc1DL0FXvzy?=
 =?iso-8859-1?Q?4AKuIg4/PliWwpIPsUMD8d/vj5Fw9yrQVHNUOsm4LI4NOwOxQurebHkRhk?=
 =?iso-8859-1?Q?rcfHGiBdVK5b9xRD1l61cgG54I4wFiK/VWFuwdIx2PE+BLHrja3q7gKmvS?=
 =?iso-8859-1?Q?iDW+tULAuP8mYB5zyO6306jNnFdfiGTAZAhr1CxQ0bNpmCFuV0vVrjjSAw?=
 =?iso-8859-1?Q?h5G/K7W8yIo2HUWfRS/Xa1VC5SgFkQ4OdyOWnlxtybG9afmrqlOOPQ97ml?=
 =?iso-8859-1?Q?P8Tjwv3GdpUI23h8wZ8DYBedgWasrtR2UiO3dmndD9tDHYDKRJHnRcpXCT?=
 =?iso-8859-1?Q?Jf/JhgjUwURVwbp463CTiiAf1Cu5+b8Mv3EgjJ1EYq6eeCLQLYvpgulqJ7?=
 =?iso-8859-1?Q?Bw8BkWPTvejXdFOlqLzE6h7nb6QMLzvObJva3rXSKatw3Imn11yUZEKQ?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SH0PR01MB0841.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 7bc5d53d-7c30-458c-3671-08de5b083711
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2026 05:19:57.4608
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ln99GMJJGBZ4ncMeiuToQambKH87bj0IlnIRWY0wndnWEQXJPd7G9iXLXp4B7sup7Xp3NdcDqt91tsZm8wDcidilQ7ebUF6PR/OgU2Gkk94=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SH0PR01MB0681
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_212020_894906_3CA29F12 
X-CRM114-Status: GOOD (  27.66  )
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

On Saturday, January 24, 2026 3:37 AM, Frank Li <Frank.li@nxp.com> wrote:

> On Thu, Jan 22, 2026 at 06:08:29PM +0000, Joshua Yeong wrote:
> > On Friday, January 23, 2026 1:58 AM, David Nystr=F6m wrote:
> >
> > > Add the ability to rescan the i3c bus from userspace, i.e. provoke a =
DDA.
> > > The usecase could be f.ex. an i3cdev userspace driver for a device wi=
th broken hotjoin support. If the i3c device boots slowly, it might be miss=
 the DDA during boot.
> > >
> > > Signed-off-by: David Nystr=F6m <david.nystrom@est.tech>
> > > ---
> >
> > Can we rename rescan to something where indicate we are only doing ENTD=
AA? I think rescan keyword should be reserved for complete rescan of i3c bu=
s.
> > DISEC -> RSTDAA -> ENTDAA -> ...
>
> Look like this is more userful. The only do_daa() is not enough for resca=
n.
>
> Frank

If the other patch gets accepted ([PATCH V4 1/3] i3c: master: Add i3c_maste=
r_do_daa_ext() for post-hibernation address recovery)
Perhaps we can rename here to match what is being used there.

Joshua

> >
> > > Changes in v2:
> > > - Improved the commit message with "why".
> > > - Link to v1: =

> > > https://patch.msgid.link/20260122-i3c_rescan-v1-1-0c17071e232b@est.t
> > > ech
> > > ---
> > >  drivers/i3c/master.c | 24 ++++++++++++++++++++++++
> > >  1 file changed, 24 insertions(+)
> > >
> > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c index =

> > > 80dda0e85558..edeae7493b3b 100644
> > > --- a/drivers/i3c/master.c
> > > +++ b/drivers/i3c/master.c
> > > @@ -758,6 +758,29 @@ static ssize_t =

> > > dev_nack_retry_count_store(struct device *dev,
> > >
> > >  static DEVICE_ATTR_RW(dev_nack_retry_count);
> > >
> > > +static ssize_t rescan_store(struct device *dev,
> > > +			    struct device_attribute *attr,
> > > +			    const char *buf, size_t count) {
> > > +	struct i3c_master_controller *master =3D dev_to_i3cmaster(dev);
> > > +	unsigned long val;
> > > +	int ret;
> > > +
> > > +	ret =3D kstrtoul(buf, 0, &val);
> > > +	if (ret)
> > > +		return ret;
> > > +
> > > +	if (val) {
> > > +		ret =3D i3c_master_do_daa(master);
> > > +		if (ret)
> > > +			return ret;
> > > +	}
> > > +
> > > +	return count;
> > > +}
> > > +
> > > +static DEVICE_ATTR_WO(rescan);
> > > +
> > >  static struct attribute *i3c_masterdev_attrs[] =3D {
> > >  	&dev_attr_mode.attr,
> > >  	&dev_attr_current_master.attr,
> > > @@ -769,6 +792,7 @@ static struct attribute *i3c_masterdev_attrs[] =
=3D {
> > >  	&dev_attr_dynamic_address.attr,
> > >  	&dev_attr_hdrcap.attr,
> > >  	&dev_attr_hotjoin.attr,
> > > +	&dev_attr_rescan.attr,
> > >  	NULL,
> > >  };
> > >  ATTRIBUTE_GROUPS(i3c_masterdev);
> > >
> > > ---
> > > base-commit: e3b32dcb9f23e3c3927ef3eec6a5842a988fb574
> > > change-id: 20260116-i3c_rescan-4921d0b41a00
> > >
> > > Best regards,
> > > --
> > > David Nystr=F6m <david.nystrom@est.tech>
> > >
> > >
> > > --
> > > linux-i3c mailing list
> > > linux-i3c@lists.infradead.org
> > > http://lists.infradead.org/mailman/listinfo/linux-i3c

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
