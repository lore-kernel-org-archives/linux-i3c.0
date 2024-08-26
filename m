Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ABE8C5320E
	for <linux-i3c@archiver.kernel.org>; Mon, 26 Aug 2024 03:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFixj/n9kNyHhWxd/OJjEK1+0gVv5bN8tP/A5JLmVUo=; b=qe1LYFJ30+6waq
	o8C+X11ntfMJGY8VXLXvxEnuG3YHM/QNfu/R3KOu2a7XYHVRMa4GyoHdnSceetJ27DllQIZUCUBC7
	Gtu+yrJPrpiy5mj8rx2eTCks5rCvn/wqoOhpUw67NWi7JbtVCEmE+vlFl1HCQZwwqDrl/obm4/kaI
	VG835p1XPqxASPXwRk2+paerfEmDwu2uz96OaFmh0Z0I1pWc2YnthZLEhCPpWEglpXcyttSLTJAbN
	ztNifJHz+TqEQYzpSpmIUen2FLCnjENTCsYOylobnBqwAU9tPVpk6905IJnzJXyhqPWgygK1q0WPs
	+tTM1cxRoJErxOiemZmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQXz-00000005fQ0-2xVR;
	Mon, 26 Aug 2024 03:37:39 +0000
Received: from mail-sgaapc01on20705.outbound.protection.outlook.com ([2a01:111:f400:feab::705] helo=APC01-SG2-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siQXw-00000005fNr-35N7
	for linux-i3c@lists.infradead.org;
	Mon, 26 Aug 2024 03:37:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk0LIzXUhivfu1thCpIenxUFbGgOqLKx45yi74+oJnfyHGQW7BqTtAEzNZwMLsg3nkmhM86t/gnm+cGX/eCNJLhhDYKAcfI4wZNbN++pKVM1zndGZ3LJiOuIDqfD2JiNyyXg8IiFPVoU8IanbxglA+ykmTnbDe8WN61o1cwUfkEYnv7NlpyUcgzp2kadr3IClqN7WI5JK3UwTV0rli0az7bYvH3djlrVYDUHnkUfU4pA8n3Bw4rtesmWCLRAmDwnyjDEEwhipzoK4M+0VduhispU5h6F5QPVdrKVp6qVFs48/XEMPvVEsCGa5UYWMxd/54WOYzHiF5jxF59B2GTjsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ak3IZXB3kgIwdrTW3yYuu2YKOjTFVu6BrUhuadR/5Ag=;
 b=HtJueFkJmr2p4bN9mtrzFfIy3DYdBif+TlIP0YpgPcItq516ZTMYkpsOoH11lS/cap5NPssdpvWwYy+aKMT7sUeueeMO925zCigt+dj/oLTs9W8oyRg5A8ofySTA9fFnUw7a8o4fFRMCqMQ21/9/6L/4S9eawOS05ic8invWbCAnCNm8a6czhBHYPnjw8U1t70F21XVwrw9WYmXOdBpgPM3GiGKJk6yK4nH5vC1I/s0sY4pA8DblB/NuUZXr6RCGZ9SIcrjDhUKeNAGcfcj9Pxdz4TXhFCmtVM2Wl/URTDBnCagJF2//LRgQWxs8ayS98J6QGtIubw6MisQA7SmmOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ak3IZXB3kgIwdrTW3yYuu2YKOjTFVu6BrUhuadR/5Ag=;
 b=ngYk5yV7HtDHULBTQHfVe5UCKddslYdhxc/ogblac04GWSeT413XkGI+6znd+FaWsj/0MfNX/ojFMa35im7ECbc69Yn7KD3Eir6rv3CBZfHOEWnrVkMjDk/eYbm4K01sFY9z+st+AncP4CFT94ro+HXCi0cue430ylO83P9vwlfMrPg+uve/k+ZWwcpCBZ8PgJhMYVoPbKiWkxhFk4V8mT4O9roj1AGNbeY2xA4jFcKCW2KXyzKb7gxLMsBmsqxOU5CjsIPgWByqWF6H8vHkJ1yk9xzv665atSycqlHCUUAh5+eX/+I0VMYwOLxl14QHDEFskaQ8NJ6r+aMVXsABUw==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB5859.apcprd06.prod.outlook.com (2603:1096:101:c0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.24; Mon, 26 Aug
 2024 03:37:10 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%6]) with mapi id 15.20.7897.021; Mon, 26 Aug 2024
 03:37:10 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] i3c/master: cmd_v1: Fix the exit criteria for the daa
 procedure
Thread-Topic: [PATCH] i3c/master: cmd_v1: Fix the exit criteria for the daa
 procedure
Thread-Index: AQHa9SVMJyTOkrYdX02TyV7uJhekBbI0yx+AgAQbKMA=
Date: Mon, 26 Aug 2024 03:37:09 +0000
Message-ID: <OSQPR06MB7252933AEDE847FB2C31FB1F8B8B2@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20240823062535.3073706-1-billy_tsai@aspeedtech.com>
 <473d838e-7b19-46b7-99a1-73fb8037188b@linux.intel.com>
In-Reply-To: <473d838e-7b19-46b7-99a1-73fb8037188b@linux.intel.com>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB5859:EE_
x-ms-office365-filtering-correlation-id: c21e2d93-7d24-474d-3744-08dcc5805dcc
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?P9Vu+mzokmQSd+QND1OGIJJsJ2K0Hw78UxkC8S3AX1N9OgpD+Gw7oUDwXF?=
 =?iso-8859-1?Q?TdKXq/akzYDoIekGfwSzJGR+rwy+t0L9n2GaZTc9Sx6fTbGxw2X7gnLLqh?=
 =?iso-8859-1?Q?IoQRsdgbbkhSrUuXkG1KYfSEsimpUnnwGcK80IN25yWp1fTvSacxgT4rpw?=
 =?iso-8859-1?Q?SbvkPlDQKROxa/+InBTM2vHxxONy1sYnXpRguW+sTq5S/EFXErNQG3T59E?=
 =?iso-8859-1?Q?RnQZj5ACvY2YSAsGd6+ypQpBxx+1U+LVWnu6iX2n/ICQBPdj0jTQw968TQ?=
 =?iso-8859-1?Q?QamKbEwh8/HOEckZoNx57QGkvXiuTHbkKVmVhf9/XnjAQ88FIPcS3VPK9e?=
 =?iso-8859-1?Q?J4A/BkJKD/CVcPlupfZrIpwbkqdQh8Da5wpgBs5f4lP18oSk+NoTybixgk?=
 =?iso-8859-1?Q?K8/gkZMZ95QIJ24m+WzKC5qt6pMmxFKMQY5a6kcZXxR3OpfwpJtCmvyw0F?=
 =?iso-8859-1?Q?IQloSG3towCidizax+Zs/L0SZzcgK+HiHeeFeLwwTFhFOPhnoOUa4090oY?=
 =?iso-8859-1?Q?lLx/83UdXAwep1b15XK1jSpu0LPXkinSnsH4jbpHCnw9R9yJK2ZbQR2PYD?=
 =?iso-8859-1?Q?iawkKua8AnA14PHFgj2Oi+ds29OYXjIJ74U8l7uZE9cBdtfny/sQsjMxoc?=
 =?iso-8859-1?Q?xb1f4zlUqB+cDskI5t89M2AtYMy2Au+QDJrSOuiBfsawa51+CisVQSmopa?=
 =?iso-8859-1?Q?WD5L93kVxsX/RJaDhnU5wXD6qsv6jFL6nPNnTCVE3g/78g9RZfxwHnX2FT?=
 =?iso-8859-1?Q?bGsOggfWonhIPB9A+ViYJd58nnZyQS/zleVUntpbX+EX6p8Vb8+QSQJU9g?=
 =?iso-8859-1?Q?/VycMx1rczZg2Utf0FT9pvfBQwHOd/Yr87OzgbnzfellVMwu17KCCV4KB2?=
 =?iso-8859-1?Q?21dqXwWUclQucsQNzxzL3n7oM7ovQDs0wBpLIDpmIXcpYP4+z6ZIU+h0i0?=
 =?iso-8859-1?Q?R5Pu+bvnFJcwVgJL2ecrut308gXEvpj4df5DAzCfugIS5kF5pO/J7aj+rn?=
 =?iso-8859-1?Q?nMOsS7ztbKcfkdmsHuj3vEJhjSIrE7WumVJUc96nT5bAm2Oj8tlSekZbue?=
 =?iso-8859-1?Q?CW0N4R7efQdPLZGY5xbUUAqy2Tp9GZHX2FvK2xWmJO/Vxgiz10Uv54RjYn?=
 =?iso-8859-1?Q?WWBxNE8o9HfLdSBT3g3yRkW1wi8LaXLpO+RLFAPwc43AALF0/D5K6UHHfP?=
 =?iso-8859-1?Q?nNZYyoL0aLkhgid/n3ggu9OLoQIsUwnoLCsHTTqXnPivjaO3KnECUFS+Lb?=
 =?iso-8859-1?Q?uoSN6y4vzFdIuHLzcOGoQ4VjDJlSB+t7dITd2Ud/861T3X8/ImcKaDs454?=
 =?iso-8859-1?Q?lMjStsB0hHvrkqw/KaYcxkgmsDi41Rsarp9rIdXyDqa8GYFuJ8UbeADCd+?=
 =?iso-8859-1?Q?/6f+7RBpCIoP1yHRMQr1AOf6vFCNpbMX+u00FdWKRsggcRGr9Dotj7z33C?=
 =?iso-8859-1?Q?sGuN4ccfaSheoHV+1qwxvSI7U9twb/Dx8hKVwg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RZtuWUdhmWg6oyBBICyOKiF3DiA/CTX43vIQVwZEg8SpezUg28B9cwiTMK?=
 =?iso-8859-1?Q?MEMJ8x+MYjB6cX/4q2IU+NFrg3T/ZD1HrFfNbQm7kPIUHHuVcnb8HOEDHq?=
 =?iso-8859-1?Q?PmLYkta5NSdLY5yOy5E+z3FQ6zY/UZr8ZlzlBmo7aou5HZxRo8Y3Qw831X?=
 =?iso-8859-1?Q?JzeSnxt598DcktV2I5/JuSOWafejnS4/NbCl43h70hx5q/J003/iBcXszL?=
 =?iso-8859-1?Q?SlBzBfKoOLw3/eiBBLhoTLJRPbzqO4JidfwF6+gGW+XMcTDXe4noF7rwfR?=
 =?iso-8859-1?Q?6BjB4weZQTwd1TG5kzSjJ1OUgBLP1nWTG0lER5mp9upqlxoCnXbv8uJOEr?=
 =?iso-8859-1?Q?Ly+2fZP1fqV/dnCkpLyMW3C4mFoDo7glmGve/sBPTdjZt9e3WsVfzSZF3+?=
 =?iso-8859-1?Q?6WKsuWuBVSU7pcxk7tIMrI+LmNkmwjnDEG/kpyg3j73swrn0RaizUhDu66?=
 =?iso-8859-1?Q?6bzNYbtOcuaTCZF9hCHwLcVMZ6i2R/zrwnyMdDOg3cNHYmX1mMzODz5tJj?=
 =?iso-8859-1?Q?RjX9zIrZE2Qy2ez19M/jLDqEH7zIoZfvHwgO/Qq3IfsxO3sC3xOJ84MgbV?=
 =?iso-8859-1?Q?B6xxx2mnWaXsTAS1bL7HxsOCjYxfDod/6weMkIbjUXVh/9AKpWnTIfk9R0?=
 =?iso-8859-1?Q?HZzcTAGzDCByulH91WDwFZVOMAsz7eUtu703xBgB45Z46xZur9wysRY9l9?=
 =?iso-8859-1?Q?oiFL4Njo2NGGWLr04s057sxyva69U/X/FmoP9XScZiyv61YJRGYfhQWFs0?=
 =?iso-8859-1?Q?wQZhnbw+WbvsXdSpw2Kvz9zPCj2g+vGMk/jA+f7myicZZfhUdpcvgaJr9m?=
 =?iso-8859-1?Q?ZdhkbDwdtUMYnlU4ddnIdxFRK+i56m1DrTi5pHu5g+2jfRQY7tW0RvOTwi?=
 =?iso-8859-1?Q?E1IQTv2Cjg0fMEIgl8oNWtD3lvWscUBzq7Sl8OY08THxl9I1QkqcUf0Us2?=
 =?iso-8859-1?Q?L7axq+XRi3x3G/W3t/iBL7T2DJkYdFSlorUDlWP0tZMuTk/5n7cc1QdeN+?=
 =?iso-8859-1?Q?22GXVQrhPL3h8UYbAI4ebV/mc/EzCQaMgHmXeCoVZRyhNqBF+yMFz6AG/u?=
 =?iso-8859-1?Q?tjubJPYnNaCMdojYemaYobATSJ4HBDdu0CZJ8urA75IqtrIF48ArdiWIwc?=
 =?iso-8859-1?Q?QVXh7MvCfbJw9hSEEdd33KDELRCsEtb+WqaxVuMlw0tjqMzhXjL4IJHhjZ?=
 =?iso-8859-1?Q?NGAeQCPFrni/yYQQ8IEFBJGrdMX8uAInx5D7Wk4cByN5ET8/j50rwWnX6D?=
 =?iso-8859-1?Q?p2INuhHr92MNR7A70lZ/8WBakYPyZTOMp/qwgALCZCX22dY+OmQ+zQdHTh?=
 =?iso-8859-1?Q?J8c33615KI9dWhQwDBtrmhaQY1ETEW+uekmqQVFXQy7sSgcqj8f0lJDTsf?=
 =?iso-8859-1?Q?F1AB09eUAQeZ3gOOdm0BAYeAkm07ZOBGx7XZkL1zTaSjDk3gN0zifg5wCv?=
 =?iso-8859-1?Q?+BWpQjYik3q5N3R34EjL29+vUjQV6ZOXGfmkZxxbqcx1lE0mHkT0MP8Vpw?=
 =?iso-8859-1?Q?klBflU8rd7GZ2HAw0drxLUzy9v98GB2JcneLfzL4Q4+R4dfk/V/xJUg3og?=
 =?iso-8859-1?Q?SyMI8rHaDCuB6II+/GqLw3k2qIQuTayZ+uYdSFMJj7vP56EgwvdzRwSj6n?=
 =?iso-8859-1?Q?99bo95rxmfdhMKQS8AH5049QQ+aFn8oFW6?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c21e2d93-7d24-474d-3744-08dcc5805dcc
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Aug 2024 03:37:09.9292
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sq9UwtBQgiKxnEfl7vO66Lgd2VJqngkTLsKvz+bUom5gAKK+vswu6vqBnsCgWQzOzPECGyq5TS0qS0PCADtKzcz2rY84sPZW4vtcgMrKLEM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5859
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240825_203736_798117_DFF7449A 
X-CRM114-Status: GOOD (  14.89  )
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

> > The exit criteria for the DAA should check if the data length is equal to
> > 1, instead of checking if the response status is equal to 1.
> >
> > Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> > ---
> >   drivers/i3c/master/mipi-i3c-hci/cmd_v1.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> > index d97c3175e0e2..6a781f89b0e4 100644
> > --- a/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> > +++ b/drivers/i3c/master/mipi-i3c-hci/cmd_v1.c
> > @@ -339,7 +339,7 @@ static int hci_cmd_v1_daa(struct i3c_hci *hci)
> >                        break;
> >                }
> >                if (RESP_STATUS(xfer[0].response) == RESP_ERR_NACK &&
> > -                 RESP_STATUS(xfer[0].response) == 1) {
> > +                 RESP_DATA_LENGTH(xfer->response) == 1) {
> >                        ret = 0;  /* no more devices to be assigned */
> >                        break;
> >                }
> Did you accidentally resend this from a local tree? Is this the same
> than your commit cbf871e6d8ce ("i3c/master: cmd_v1: Fix the exit
> criteria for the daa procedure")?

Sorry,  I have re-sent the previous patch from my local machine.
-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
