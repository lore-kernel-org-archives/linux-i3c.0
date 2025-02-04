Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0EF4C02194
	for <linux-i3c@archiver.kernel.org>; Tue,  4 Feb 2025 10:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rQZwtgTsgVRfoonYyh9OB5dEiOVyFlphpgx2M7Ne7A0=; b=R/QFuFbifSHIFS
	f01X6glqSn5u2WRnnbe64g9DeXntLdgucTPaTFDDohw8Gxd1/gbvd4NOg5alm14bhfvNboZslGBfF
	h9oBRrmgMTXt9Rq3VMjwwf3B3XyoFOlT/3F5TYDjTXR5PBmnXrEie+PosTTxs167f7NStkEZP5rqH
	YzjBV0RC6uYTZkW8q/W1KzdmCZcU7WUorHPVWLz0HOTblfjP4MrTua5WMzzHMCkRLPnDbcuL3jxmE
	H+yCapgnGGdk5F2u8R/pTrrjvOTAx/mHOUBtia70J7EiPZHZGgYrdJlSKCxAnIjZE9518+v357zuD
	ABJl0lZXSSAklJ39gdXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFsJ-000000007z5-1yUC;
	Tue, 04 Feb 2025 10:09:47 +0000
Received: from mail-tyzapc01on20731.outbound.protection.outlook.com ([2a01:111:f403:2011::731] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfFsH-000000007yH-1uTB
	for linux-i3c@lists.infradead.org;
	Tue, 04 Feb 2025 10:09:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HD53OsPgWLBLpuKQ9polyUZFSw8n9d74PoZ9w64vUWAQ40+e7/9UXRP8H/oizeK1bZwY9U5bvs6cK+bVx1674qN3mtk3pl1Xqntp4vl1AXb5uKyRxe92A94YhS15mixwYz93WmiFrLL/xHXZctsQQuO5pxZlVSmpqCyLBPZr5ytRIS8Rb+Agm+veDLS2a9/8D+OMeR27XJJR7ytM0nSXzA7ecppMLkbi9jmybWH3KYV66Tqzprc0sKvPDit5m0WslDFh45O4eqDAbj+q1RyrfbesrYRydghPh6zH86UsAeXTumMhzLr5dxQI2FiK9AvEqb4CPyyhitU0ZiY0iFbByA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=69wzbvpmrFxh0BioWW43sLLByrgO4WWW3vgIW1YiiiI=;
 b=rLKeg00PWgowE/V5m+IAObKme5s0/1Zromfwe5JBSbnV7QuYYnn5opObyPO8swhfO0FPQR56UuK6mjujGofcHwIDpEXG288zcGWne8an8GMfwWP/viJLdomh/CfNyZv0B4Y89twb5+VCgfcdbPJaVatFlK2e0M35AAX2gIOXhJ763Z3NNlsOmNns3tl1Z2LtKuqC+7nKIv/ZafLw5jUA7KdBawnLwh5aduVFQJRShBZwxwB92KybQOAQGKLi8Deo+tuLfJL3DbLR8z1oAG1lv8h0+Rw6zX/TOeuYoWFy4HReLJ7LVZ5lnPdKE8TV4msjP4BjHFT0WOiOxnM2MoGqfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aspeedtech.com; dmarc=pass action=none
 header.from=aspeedtech.com; dkim=pass header.d=aspeedtech.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aspeedtech.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=69wzbvpmrFxh0BioWW43sLLByrgO4WWW3vgIW1YiiiI=;
 b=GF6e8gOTdQB5OMRkQTmrwiZgBKcDou5NkfU5DJOF4br3bMovkeTfGEl3ryNEXFGRQaDxEAJmv4esg7tH1yNvZyYh7jnhwqlLO6f9Y/bbU0eBm6pTsxsTvSDyEkLBqdRA9HYFmwvG7jX6qEjSoW6zbctrXcne+0tyEQCzyrpqL7ME3nrf3y7RX9TUgS0QpbhIBO5P+2ObqfxhBMEzlcj/Grdv8PwldUNrsms1MBLi/L3dZJJjQBdVxJy/xWsyYmTjdNzd2PcLXsyYR+34bbwMceXNmPM+UErEGdBkAVRCIU1YBuxoz0LjykrxrLsMgUvQkQiIJWC1bZHqqljJQnNXHQ==
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com (2603:1096:604:29c::6)
 by SEYPR06MB5254.apcprd06.prod.outlook.com (2603:1096:101:86::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.8; Tue, 4 Feb
 2025 10:09:32 +0000
Received: from OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448]) by OSQPR06MB7252.apcprd06.prod.outlook.com
 ([fe80::814e:819a:7d52:7448%7]) with mapi id 15.20.8422.005; Tue, 4 Feb 2025
 10:09:32 +0000
From: Billy Tsai <billy_tsai@aspeedtech.com>
To: =?iso-8859-1?Q?Thomas_Wei=DFschuh?= <linux@weissschuh.net>
CC: "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"pgaj@cadence.com" <pgaj@cadence.com>, "miquel.raynal@bootlin.com"
	<miquel.raynal@bootlin.com>, "conor.culhane@silvaco.com"
	<conor.culhane@silvaco.com>, "aniketmaurya@google.com"
	<aniketmaurya@google.com>, "Shyam-sundar.S-k@amd.com"
	<Shyam-sundar.S-k@amd.com>, "jarkko.nikula@linux.intel.com"
	<jarkko.nikula@linux.intel.com>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "xiaopei01@kylinos.cn"
	<xiaopei01@kylinos.cn>, "Guruvendra.Punugupati@amd.com"
	<Guruvendra.Punugupati@amd.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, BMC-SW <BMC-SW@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Thread-Topic: [PATCH v2 1/2] i3c: Remove the const qualifier from i2c_msg
 pointer in i2c_xfers API
Thread-Index: AQHbduWQkLObShg2b0Cq9ES//Yek0rM25q0AgAADEP8=
Date: Tue, 4 Feb 2025 10:09:31 +0000
Message-ID: <OSQPR06MB725203E31EBAC2B71A7901E48BF42@OSQPR06MB7252.apcprd06.prod.outlook.com>
References: <20250204091702.4014466-1-billy_tsai@aspeedtech.com>
 <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
In-Reply-To: <f9f730b6-4620-49dd-9700-ee18f777045f@t-8ch.de>
Accept-Language: en-US, zh-TW
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aspeedtech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OSQPR06MB7252:EE_|SEYPR06MB5254:EE_
x-ms-office365-filtering-correlation-id: a103363d-cede-430c-7762-08dd450404dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016|38070700018;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?8Nzylx0pJUBl43wnJXsTSCo3/3Sh8Rs5847Zur572AunYuSqnvd6GQa9y4?=
 =?iso-8859-1?Q?PX9EDN6ZcubQQfdtnbsktWpIbRE9j+AN06kTBffUVux/8hgOyuPG/GSKP/?=
 =?iso-8859-1?Q?HSe60ZEolAYWSzfNCbkCGRD40SeMZzmUVgV9mCS8WwgF0V9FMwIbdDYZS3?=
 =?iso-8859-1?Q?MrYmojkRWjlQRVMQvghEjNZlEzfHn8fmP+zKXXW4zLYFwdqTzKwwwsv7X8?=
 =?iso-8859-1?Q?BezslAMFvlOuOTBFFVd82jhFsCZWw5c02JrNcn6pCEpt+hU4r3Hs3aZPss?=
 =?iso-8859-1?Q?7CIwWscXLJYBt2Dff0xXb8RzjH0PXmuLD4j16zsS6mSRNx8lxfDfSppQg2?=
 =?iso-8859-1?Q?RnZ6uXAl7/6JiZYTGBMcAPCLwKS4qgD7H/sJ2C9TG3UZs6CBnS06WrTwRG?=
 =?iso-8859-1?Q?z1/THDkz8dBiAfYfl4vRnI0wvEV5+vc8LNs5pn4ynSQFpsUrOeeY2E5xa2?=
 =?iso-8859-1?Q?pJnTIcymlYKWdwnUhLwzpvRvDisKfLiHpXh30El3IVXMcNpPGliJvwtBio?=
 =?iso-8859-1?Q?d4kESblTg1dB9xZeLPMza0W/8XA1tmzPNOQEwKytfwdl11S7BN+Q4K/SCt?=
 =?iso-8859-1?Q?cAMUpZLcXWzSqZjADn3uOttWVtQ6YMe+yGnpHw0077JPyxMlqJZxik+DD6?=
 =?iso-8859-1?Q?Ctct0xoG+KW1D6kSaMxEyqDpjq4OQ4pBWNpUtgSxgjTsoxfi6GPVKqOW7a?=
 =?iso-8859-1?Q?IUpG0tb2mPX9d5/Ijv7hHcIZAXl7pp/a2P+u8ZrHbYjlgQ/qV2zh3CXp3t?=
 =?iso-8859-1?Q?vLMOEgfrAUqhRhkGTpYQRGfG+iihiLJ9wvKR6IY6Iwn6e2WlXLRYgLo1n9?=
 =?iso-8859-1?Q?2Em8PWBoEAoHSzd8LNMGLtSbII49dEOgLW/xmg/Y263TvDRhhq+nY4aKYp?=
 =?iso-8859-1?Q?WFBepHcO+gKbr4qNzQTwgcQ5fZ5z6eZh8MS6p3zWymGex5sbzZryNcE6Ds?=
 =?iso-8859-1?Q?NvPRuajZyRsH71NYzqOYi3a5LtPe8vYb4otdqJ8t+LZV/L2i0uSE9tIUOf?=
 =?iso-8859-1?Q?Y+WopezHxy/DNP2oqsBRgVQKnG+1vREhyjEtnS1it9fZgkk2lt6wv2szuM?=
 =?iso-8859-1?Q?sE7VCFRw6b/yRNFBDmXWDauH12AaRJ+cSGs4kBsUaAndcFW2HGSpFPoXUh?=
 =?iso-8859-1?Q?05DUl1WBg5vSAMUpiMFHC2iGuFm+lP5b6hrhAb4M2uVxfLS3TqMEhkzqK0?=
 =?iso-8859-1?Q?1m5NZI0HUk3yo3z+U0vTHxh0Rs1ol9MUgmrFU3UAHUE0aU9Me4pyO7rmry?=
 =?iso-8859-1?Q?6V+aOiMynjblY/koz86RlW883fxQcBVhYBY+shA04xmeOLyxVFE/uE4Mh+?=
 =?iso-8859-1?Q?f4inm4RWo5xp0H9iCb36NH8je7UiG/LTzPUNAaL7Ws1T8U70c9QIKfWwqp?=
 =?iso-8859-1?Q?B7InGuS0wrr5Z1JoB4FUMEuLZvRkYmz2Ld7z9UMO3Dsv4e3u60zT8KZR+9?=
 =?iso-8859-1?Q?nqWmGvyVp7hBDndzPkXtbp8AlS5cvnnR8YrFbEQ0I+8/kOhrm1l4/Lp2kC?=
 =?iso-8859-1?Q?1DC/rCdAXArrmj92tkmSEl?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSQPR06MB7252.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(38070700018);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?bFsLxTgMXjzC8TxemzpvMFPeDD48RqE8NhN0ZEDMguuujxMS/3G08TJ2iR?=
 =?iso-8859-1?Q?Ouos1wSb4DK0wHKUb8fpg6Xcrl3nGdc0s/MHmiPAsvmkE0f6kkT9KwO5HO?=
 =?iso-8859-1?Q?nzPRAkJ7nvrUByisAVt6ov9OpdE+OrHdE4kV1RP0ftuXcfWqzTzCMHMFdo?=
 =?iso-8859-1?Q?VCKNEgekr48Me459HmmG7QkpjXsVZ+0lZ8E+TeHOZ1qm/Lm6R9nSQgQTLH?=
 =?iso-8859-1?Q?PBw+dD+PiGq/m7FuC/4lFjRtCXPHikA6rhhqiYFwF1oCjiGzAkNSKyXJW0?=
 =?iso-8859-1?Q?eB24lUyYS7jrOROph/jkDjNzXcOwn/ljigvZMVrg5CiWK7QSvur3qN7R28?=
 =?iso-8859-1?Q?uoTFpEZZ/oaSC6uYa6Yu4bHqIyFA/wzNhNQSjY3xvSgYGRjlNZcQHmpz0t?=
 =?iso-8859-1?Q?G9iURnAF6bolLdPJD/HXtKuAgJzIrQYEe40dliHqva/abI1zvfHP2EsBxT?=
 =?iso-8859-1?Q?j+XhrTpoeBlCH3OO3LCNrQSd3Xl0mgrTGViRqnrgkRxhr0mNz1H3LLUYVe?=
 =?iso-8859-1?Q?mEYDjBSC0DIaaO/cys/nWef04bzkE02CeX00LzT6k/nKtf0gnvBFLGiJmF?=
 =?iso-8859-1?Q?+XtlY+3PbEkFEM2DNsBOgmzl9ZFsayqfDJoUp32JVet0z4x7U/3Zf5geEa?=
 =?iso-8859-1?Q?GpxT5qQmDF2IXQCOM3AD5mNK87XoWrJ1eMDAt4K9+7Cmya+29H8mbjjCzn?=
 =?iso-8859-1?Q?q45bIewZG0YTB08/cuviCM4reiOdo6vCv08unYZ5dcKhIdKDxlYRT+ny2H?=
 =?iso-8859-1?Q?bCH8VXBUZqTRwVt8rEaC5C+vufEIQaTXVGv+Aa9988qdfbxGN7NwsNw2NL?=
 =?iso-8859-1?Q?upTEnb6IcHntB2kUfD8B6eY7WhNRg59EHBAbV1xcmujKTuxy3Gju6jIu9j?=
 =?iso-8859-1?Q?xW+ur5kPEjXySUsGJtlbbdrDP8xC4xMygfji6HCVMd4Myp3X2Y2ezenzaP?=
 =?iso-8859-1?Q?84pGd/4D3Ey/Pl89YIrssyMQe2rNcyMfAxiq/ry3KLVMqjyNgcftRMd++P?=
 =?iso-8859-1?Q?7bGg6O4Lly4Z0X9szN84UDMT5FnxEVkQUv74dQ3XA2ps5Fspe1pftfH6Jq?=
 =?iso-8859-1?Q?ODjmkv+NLHFWbS4rnZRv1S/jp6FOPl12n7EuVnVLbEW16T5dVz2rpz4VM9?=
 =?iso-8859-1?Q?AImDYFJVVWbQstNqE7Om3XAshKDHl0DRYLlMfcn2zqNROez4OAe5CtfPY9?=
 =?iso-8859-1?Q?Gjy6G0vxKgJ59BFCNyEgIhaWjGyCwos/TlZ12VmQqWKLIdnC0RqW+5JwaL?=
 =?iso-8859-1?Q?FY7id78d5/hrCmI4lTTu5ZsTdZ/e3wBvdNXN4G0xzRbn5TZBD/e+e6UbNO?=
 =?iso-8859-1?Q?fSZyMEqCWlJHUPeLtEM/IEib+7r5x9zcPpHG0RKg37RYKOFh7dPKVbXfKs?=
 =?iso-8859-1?Q?1l/KYlAucZyu5Xf7Wf0jLXLgC4U71ZfUQlkPOzk2J0DR/7oiwfL0QTCuVf?=
 =?iso-8859-1?Q?0cKmKMWHdodYt+xLLx2eJuPxaXLfPrL/4Aw/M8OwR35C6EDMWTWi31PHAk?=
 =?iso-8859-1?Q?t0HB55vS74WS9oEmIIXMHp/4cdBiwljChF/d2/4VbDYvqmKCzqGPUol0DN?=
 =?iso-8859-1?Q?bY2y1ztnVSrjLQ4Bx/8g3tWCzYIXguoK/ETHfdigtmk/+oTW5yXt62gPOj?=
 =?iso-8859-1?Q?a6IGp8yIvbtJDgMzAi+fhaEq0SrzGx7XNS?=
MIME-Version: 1.0
X-OriginatorOrg: aspeedtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSQPR06MB7252.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a103363d-cede-430c-7762-08dd450404dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Feb 2025 10:09:32.0035
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43d4aa98-e35b-4575-8939-080e90d5a249
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lwvT/a5bCapXQQpmlEqh00DDA8aQ5p6KeZdKA9M6qjzUuFq/7lTUj7g/blNpCZs74dCVa5+Ruzm4TSqUOt6jPuet6k1Hsl1kLc0fLbSDILA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5254
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_020945_498548_4452F654 
X-CRM114-Status: GOOD (  11.73  )
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

> On 2025-02-04 17:17:01+0800, Billy Tsai wrote:
> > The change is necessary to enable the use of the
> > `i2c_get_dma_safe_msg_buf()` API, which requires a non-const
> > `struct i2c_msg *` to operate. The `i2c_get_dma_safe_msg_buf()` function
> > ensures safe handling of I2C messages when using DMA, making it essential
> > for scenarios where DMA transfers are involved. By removing the `const`
> > qualifier, this patch allows drivers to prepare and manage DMA-safe
> > buffers directly.

> This is missing a changelog to v1 of the series.

> Also I asked before why it is not possible to change the signature of
> i2c_get_dma_safe_msg_buf() to accept 'const struct i2c_msg *' [0].
> That looks like the nicer solution to me.

Hi Thomas,

The i2c_get_dma_safe_msg_buf() function has existed for a long time, but I do not know the original reason why it declares struct i2c_msg * without const. However, I believe this is because the i2c_put_dma_safe_msg_buf() function modifies the buffer data, so for consistency, it is declared without const.

Best regards,
Billy Tsai.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
