Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FBB7CAC5A5
	for <linux-i3c@archiver.kernel.org>; Thu, 25 Sep 2025 05:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AaSdZkyL+AvTyBXSaf5hmS27ogv3Mnx1zUcEqhHKhgk=; b=qOM+VzclMLlhpK
	Q/OdXViAmUV3mYheDCyo2GtlF7vMdd2sdDnAd2JEHCvl/AhIvZSSDT6bM0QPQpK/WielVkZmxxoDR
	G4QTAL6yUCh4Gw+gZYWJtu1nGIVTDstXZsdAndKXKui3DOb1V8fwDFTzvYcuJKB9Z/OM8hiTDBjtZ
	VvfQeZjUwZX4mWGQzPfo7wW7CCsj3LRGKw5hbpwZWJbSyRDcl0ThHIHgNuD8A0A956mkidGK/AzdS
	KoiOdNEkloJhBRvUvV2EyfgrbKwPCp6cRzK86jVdYxlp3/p8Oxi2TjoGkqGDEvwOv0ocRazGZO4X/
	KC/+4Ya7f4GDjp49VQxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1el8-00000005yT5-3qvY;
	Thu, 25 Sep 2025 05:43:14 +0000
Received: from mail-westus3azlp170120001.outbound.protection.outlook.com ([2a01:111:f403:c107::1] helo=PH8PR06CU001.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1el5-00000005yPx-31K1
	for linux-i3c@lists.infradead.org;
	Thu, 25 Sep 2025 05:43:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xdI0QZ7gdTE0xU+RlXx9bmtSyM80aFfDO9mu3FrsxNgACj5sdd6+FOZz08X1Sf+M3BdKSOE4MLa/ajpW3UYuzqLRWRTS3tjQ9r/7+CR4rguzFhoQ/Q1b0grYlLpbwcdTzjC7jPYGPDJZBCu+rmdFxFPlhCOrKJSJjJvD1tphRArPx1kMshCtbJuqlG/FyV+DoyxZnuDzE1dRfmlB/H8n7p8sQw2BugMtmZGQPKoTyEuzSfZ5qJa5Q2C4fQKU++KwR40/0N5598sgp6uUZ7Zm8kaJ/A1s/JpsM3ErXKgZjg8+bKT30Kv7bCqMUkTxRyQcrnVdSxPBKIP2Ok9koA9nvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CUFz7TNQ8kG6bDUPTuq1QVcFLi0WmwN7p9Dcl/+N+kc=;
 b=lVJTJu222dlpI1vavTB6KkTivJR1BBjgGodDpO8qm9BtbGZeYfnYqlJOmS9+vfzykoSUZ/jAjXlLnTSo1Y9rJHXvv99Q1yyyQKmozPa0Eoygu5al+xfLczsOE5I3ljTkzTYkZdTJcKAE15ypZObnL9F8vq9L+rQNZ8QFpMNi8hP7G2ipkfi2/BKfza+PeRoEzAe29lJXB8pNE04eWXxDai6BP7hevN29vgCICWtrYEqQa8r8UrNnGrYDC3w6K5rrKIwTSvnSsdtMOtopUM4bqZyjXIa3Hf13lqFg4uFt4/up13jTcOELVutv4ZiGU7I9b01ZuR1P8VJTuSvEkrDkIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CUFz7TNQ8kG6bDUPTuq1QVcFLi0WmwN7p9Dcl/+N+kc=;
 b=Ugxqnn0SDNmKNyi3SIiG9FQ6uO9pi5B+2gQZLU9gs1VBR7hk8agyZDa/i/wSdVIjH2dtg+tuHyrVhr9R55VMbjMwYGnjqV4XVvoCU1s2g9P0szOhQH6OeiGRmEq/Sgh2FC//QAt7GwZUTeE3Abpdfs6V38zlTsM4gSJUB5OGT5E=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 DM4PR12MB7742.namprd12.prod.outlook.com (2603:10b6:8:102::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.9; Thu, 25 Sep 2025 05:42:57 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%4]) with mapi id 15.20.9160.008; Thu, 25 Sep 2025
 05:42:56 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: Frank Li <Frank.li@nxp.com>
CC: "git (AMD-Xilinx)" <git@amd.com>, "Simek, Michal" <michal.simek@amd.com>,
	"alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>,
	"pgaj@cadence.com" <pgaj@cadence.com>, "wsa+renesas@sang-engineering.com"
	<wsa+renesas@sang-engineering.com>, "tommaso.merciai.xr@bp.renesas.com"
	<tommaso.merciai.xr@bp.renesas.com>, "arnd@arndb.de" <arnd@arndb.de>,
	"quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>, "sakari.ailus@linux.intel.com"
	<sakari.ailus@linux.intel.com>, "billy_tsai@aspeedtech.com"
	<billy_tsai@aspeedtech.com>, "kees@kernel.org" <kees@kernel.org>,
	"gustavoars@kernel.org" <gustavoars@kernel.org>,
	"jarkko.nikula@linux.intel.com" <jarkko.nikula@linux.intel.com>,
	"jorge.marques@analog.com" <jorge.marques@analog.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>, "Pandey,
 Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: RE: [PATCH V7 4/4] i3c: master: Add AMD I3C bus controller driver
Thread-Topic: [PATCH V7 4/4] i3c: master: Add AMD I3C bus controller driver
Thread-Index: AQHcLKFjBOnK6QMfOUewlLpgWcqzB7ShJZUAgAFsR5A=
Date: Thu, 25 Sep 2025 05:42:56 +0000
Message-ID: <DM4PR12MB61094D778B7B981ACA7CC4248C1FA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-5-manikanta.guntupalli@amd.com>
 <aNLzfnN0QGF0qT7e@lizhi-Precision-Tower-5810>
In-Reply-To: <aNLzfnN0QGF0qT7e@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-24T17:07:10.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|DM4PR12MB7742:EE_
x-ms-office365-filtering-correlation-id: cca972a5-7a3f-4ecb-482b-08ddfbf66124
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?us-ascii?Q?F2m6RIJyjk6NDWH4J6tc/yG9ZderklEwgMWf8U6KQpCdG4JhjmPfKHTLXoUQ?=
 =?us-ascii?Q?Em9eFSyU9Z3o36doC3xjbqglhkW6vCGzaHuEQL6CSxgZTFs1hBrMV6+7tqNn?=
 =?us-ascii?Q?8CFCrkH0DQ8+DppNBjxW1qC1GLwgqoJtJIa/nJxJcB2OiKzeeBC1vidQw5ty?=
 =?us-ascii?Q?AWadzvlz3CqLIitbdVw+UkEilDD8SsS4rYELAPNxywLSnG3ma93jyhTp/Xyo?=
 =?us-ascii?Q?cneQF74cUutvk8i7JRqMDdRaDv29ScD3Da+giyAMEdUR5gOxI/JUDBB4rL/L?=
 =?us-ascii?Q?FNuX4QhiuU2pQNpQEnAhVKNS/G87p323WRe/G6DpRRcfuewfqrMn5OdSVE9K?=
 =?us-ascii?Q?vbNRLjzrLai7PYorwkUABZq2u2CDV9GqEaHrWYTZ6Ufcb9R97Vc0ALbcSyhz?=
 =?us-ascii?Q?dPagozwZlzj0+lfkqObIz4nrZJtRVPnUEx8H20kWP7s33ctsf6TRHvokuvE3?=
 =?us-ascii?Q?lf52EmJI54PHEi6cG9d/Bdl4QKCZMZ/wFuuAt20tzZ94RBQ3NJdMNq3GkfuG?=
 =?us-ascii?Q?vc3lDKMoNP4SuSQR/odktr7oZCTBWeHumJUs4mE+xAfufSXsdG27mwcu8vHk?=
 =?us-ascii?Q?4XbfTcI5qgPdFChAxg1FgLRQqY/3ZIWNMPF7k9qDVFNNgpvc7cQFiGI6v1By?=
 =?us-ascii?Q?fpkE9vn8xfOx9JH1eYCJZyjPkvozd3EMPciH/c24UzO8HJcajzI8xGSuIvpQ?=
 =?us-ascii?Q?T+kElhgTZC/hGgM0sBiQhz2lF1rruM+FGXhyuq1F2RCE9VfnodWttwjzA+Ht?=
 =?us-ascii?Q?NaUc9sk4abNiDeTK8mxXCt/g9HWoBMG89SwkuGJawFCbAOhNfNp6YiqiiJMh?=
 =?us-ascii?Q?a37H/iXVY9dbFMxTQRomsLT1DVFQ7xARg7+a6sYimfkxE58z/6dEHQLESJqU?=
 =?us-ascii?Q?glSAG3bTbEnEcHM2jFd/ejXGzwM534HwBDMmzDw5bjTjIlYUWWRk+aQft5NM?=
 =?us-ascii?Q?GARwy2o1xiLPcT9Reqfks1x3BRk7RVakmcXMoLGIdeIKMYefXKZfMnBM9RFv?=
 =?us-ascii?Q?1ag7eMK1IFb4TQaPrnH8RL6HnS61AMn0DWRXy0X4RfEBRQlX4KybdjOZLP2x?=
 =?us-ascii?Q?hYB+cDmadU3itMf9rUPUvSkCeOqK43QyMPt8SD4PauYkzTCXPriucjYBZsep?=
 =?us-ascii?Q?B/8Eox2t3CPHUQ4jXi9a/jZDhhSCJDyfIAF9MhBxMO/BzqdX+utFJae1KBmp?=
 =?us-ascii?Q?D617M/zhyDkcu6UylRJzNaWhndVA4qEz88/Jw+s6I5VBkjcU+7EvZ3Q2jpk4?=
 =?us-ascii?Q?XYSr6SIjcN1twvoT/fjBQse2bB1em57GWpZkbeeFvZBXWnAdDiL89eGjYxoW?=
 =?us-ascii?Q?OBrKo7uhRLH6IzJVrgdqG0g1LbdOScK1CFoYlJrMNlQvqca6r35ZpGI0FGLQ?=
 =?us-ascii?Q?cA2dSZBajvmyJcUkSJ5T5JvNx3hAotoKwEHXAanGLDnw71JynKRqkcHRTEIs?=
 =?us-ascii?Q?H8Ttr/GZPyh4gOVzlRVs0Jcw2MGiZBJXFqw+8jxUzROuqm5hR7tsTg=3D=3D?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?yTkQkVne/xgIzsJM9TJ/oqXPki6nwsAgAFrP+TKuixkCX9bG6V0NFkcsVTWe?=
 =?us-ascii?Q?9KctkBJukc4w86O17b52EltQBRpNFV05jR4k9WLPwbvL+Jf4ie+L1hsRMpaT?=
 =?us-ascii?Q?SVccyXlPyzEzvUGio0KkiLSckyUDjT2ok83MNQMcoarh06QisL51KIPeNFRG?=
 =?us-ascii?Q?Dk2vJldFI+lRRj/RMWIRJM4KbuuHUCEXeMFHaKZm4VuW5UpcT9LndSzZfq6G?=
 =?us-ascii?Q?2PezDU6dZEOPlRcw7mOxaZ2a8hLy/LPgM/txdgKczVvugtC1FljhXeNEw2PI?=
 =?us-ascii?Q?XIL7cXgciUtZCJYq4TvW/aC7p/oSGQaWlybkBcNlEtWhFB5mLFlTLY6o2wQm?=
 =?us-ascii?Q?THVFyk5jbH3Z2qCJ+djPlEgwy+5qvmktA48uKS3wuGI/Vr7uRJNjj+AG4s+M?=
 =?us-ascii?Q?fddBx6uq405D3y77/P0iNBtz1ZngZtIyVZtUDJCaMOTUoRX8j2VEDObiKwbw?=
 =?us-ascii?Q?RfoFhRFLt4vouju4geTEAg077HInKctKDyy9owJUINd5sPTSodPftTjChT8m?=
 =?us-ascii?Q?zfezc+jyLMqrWngD5O+Wj9hB85JxSVabcRZbhujCaPhyKGfu8nGtmvLrz9wa?=
 =?us-ascii?Q?b6uDzSXlnEUsh4LUXeNhqKCOEebkoIVrewIW7MlUcnRVKTz9BuWiL1hrCo3N?=
 =?us-ascii?Q?a0S6wKgg6/ySKLLuGVCD0xo7ze7hYQyBX2mxOR+hIp6fSvUpSGzXN/kckAMF?=
 =?us-ascii?Q?XrB86uSccU/htcKLVxZpCkzYcM2sjfb0apFHIL/Z+c2OFUX6y/Y99nl8n3fe?=
 =?us-ascii?Q?b2vhEGkCVU6H15be/np+OxEToemsHwM2XwNKHOLtTJnnvABoTmqnYMef+sYO?=
 =?us-ascii?Q?R9XwjFgvJte982ozdayZvqnkWMKdSErmwUqL+y/WA58EcmakiRL5oh0ojRUm?=
 =?us-ascii?Q?909S7bnV/x9NjSFQMIi2kHArz9haSxujhfjtCyzL3jmv7PEQFbm6wKsHS45y?=
 =?us-ascii?Q?25ma21aWLZjsQufFY7gXD3kna5378afJdYbi0lrn1y+LDQ/xpwN89hTs73Dn?=
 =?us-ascii?Q?SLi55V5ojVzaV3tX6Jcw49BWo4P4p6E8RLzhtAdsZE2/zmelch4EtQuX4OYA?=
 =?us-ascii?Q?7Um5GNg5jtdQSeYhiNTeAbsWa3K80/5x3ahXsB4lnPTsEvhheM1RshDBEq17?=
 =?us-ascii?Q?/TG12H8wxuOJ/jj7GYLjyMCYrHOjC+Bi3B1xiLE9Hnem/p5HZ+3cmEADLGg4?=
 =?us-ascii?Q?H3uXQHCkUx13U1VeO4X+Ej6iojFJcrTF8bsAMk2eQ1K97St4a0s859nWRZVE?=
 =?us-ascii?Q?89TQaZS5PjC8o+Be5mAfB/6dd75nPxsSpp5XRCRVM/6EdgN9zdoOFBsyAKDs?=
 =?us-ascii?Q?yvGvrCYXTK9/vOmE+vUBciu+EeooDBIGaYH7O8xJuYiu4QGiS7Dxo5PfYLq6?=
 =?us-ascii?Q?3qI5erFFKbY8+mkSicF9+2iOnLtgEYNS0rsibhbInUNrBMcpseNk4t1nYlQg?=
 =?us-ascii?Q?FgMqm8TFdqt8GEEpnUH9/TnDlPgjlK9P2HeEAtKMTANO8hCl5cs5xVYhzRWO?=
 =?us-ascii?Q?j/md5fV9a7VG9gGABC2Y4kyHMpHOl7BpXGdR5n8R/9iPzJSQ/sLITR0h+X3R?=
 =?us-ascii?Q?G0du7jxXEuhES9aAAwA=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cca972a5-7a3f-4ecb-482b-08ddfbf66124
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Sep 2025 05:42:56.6491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UvSKIO2CLZdImEcL4b10zgds05l5A4n0qY+6QI+jtoMH4f9tQQMk3IUPRneV/nVmR7vuT+aMRROs/jQuwfe2hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7742
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_224311_808015_EAD7D94A 
X-CRM114-Status: GOOD (  27.62  )
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

[Public]

Hi,

> -----Original Message-----
> From: Frank Li <Frank.li@nxp.com>
> Sent: Wednesday, September 24, 2025 12:53 AM
> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>
> Cc: git (AMD-Xilinx) <git@amd.com>; Simek, Michal <michal.simek@amd.com>;
> alexandre.belloni@bootlin.com; robh@kernel.org; krzk+dt@kernel.org;
> conor+dt@kernel.org; pgaj@cadence.com; wsa+renesas@sang-engineering.com;
> tommaso.merciai.xr@bp.renesas.com; arnd@arndb.de;
> quic_msavaliy@quicinc.com; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>;
> sakari.ailus@linux.intel.com; billy_tsai@aspeedtech.com; kees@kernel.org;
> gustavoars@kernel.org; jarkko.nikula@linux.intel.com; jorge.marques@analog.com;
> linux-i3c@lists.infradead.org; devicetree@vger.kernel.org; linux-
> kernel@vger.kernel.org; linux-arch@vger.kernel.org; linux-
> hardening@vger.kernel.org; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>;
> Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; manion05gk@gmail.com
> Subject: Re: [PATCH V7 4/4] i3c: master: Add AMD I3C bus controller driver
>
> On Tue, Sep 23, 2025 at 09:15:51PM +0530, Manikanta Guntupalli wrote:
> > Add an I3C master driver and maintainers fragment for the AMD I3C bus
> > controller.
> >
> > The driver currently supports the I3C bus operating in SDR i3c mode,
> > with features including Dynamic Address Assignment, private data
> > transfers, and CCC transfers in both broadcast and direct modes. It
> > also supports operation in I2C mode.
> >
> > Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > ---
> > Changes for V2:
> > Updated commit description.
> > Added mixed mode support with clock configuration.
> > Converted smaller functions into inline functions.
> > Used FIELD_GET() in xi3c_get_response().
> > Updated xi3c_master_rd_from_rx_fifo() to use cmd->rx_buf.
> > Used parity8() for address parity calculation.
> > Added guards for locks.
> > Dropped num_targets and updated xi3c_master_do_daa().
> > Used __free(kfree) in xi3c_master_send_bdcast_ccc_cmd().
> > Dropped PM runtime support.
> > Updated xi3c_master_read() and xi3c_master_write() with
> > xi3c_is_resp_available() check.
> > Created separate functions: xi3c_master_init() and xi3c_master_reinit().
> > Used xi3c_master_init() in bus initialization and xi3c_master_reinit()
> > in error paths.
> > Added DAA structure to xi3c_master structure.
> >
> > Changes for V3:
> > Resolved merge conflicts.
> >
> > Changes for V4:
> > Updated timeout macros.
> > Removed type casting for xi3c_is_resp_available() macro.
> > Used ioread32() and iowrite32() instead of readl() and writel() to
> > keep consistency.
> > Read XI3C_RESET_OFFSET reg before udelay().
> > Removed xi3c_master_free_xfer() and directly used kfree().
> > Skipped checking return value of i3c_master_add_i3c_dev_locked().
> > Used devm_mutex_init() instead of mutex_init().
> >
> > Changes for V5:
> > Used GENMASK_ULL for PID mask as it's 64bit mask.
> >
> > Changes for V6:
> > Removed typecast for xi3c_getrevisionnumber(), xi3c_wrfifolevel(), and
> > xi3c_rdfifolevel().
> > Replaced dynamic allocation with a static variable for pid_bcr_dcr.
> > Fixed sparse warning in do_daa by typecasting the address parity value
> > to u8.
> > Fixed sparse warning in xi3c_master_bus_init by typecasting the pid
> > value to u64 in info.pid calculation.
> >
> > Changes for V7:
> > Updated timeout macro name.
> > Updated xi3c_master_wr_to_tx_fifo() and xi3c_master_rd_from_rx_fifo()
> > to use i3c_writel_fifo() and i3c_readl_fifo().
> > ---
> >  MAINTAINERS                         |    7 +
> >  drivers/i3c/master/Kconfig          |   16 +
> >  drivers/i3c/master/Makefile         |    1 +
> >  drivers/i3c/master/amd-i3c-master.c | 1012
> > +++++++++++++++++++++++++++
> >  4 files changed, 1036 insertions(+)
> >  create mode 100644 drivers/i3c/master/amd-i3c-master.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS index
> > 8886d66bd824..fe88efb41f5b 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -11782,6 +11782,13 @@ L: linux-i2c@vger.kernel.org
> >  S: Maintained
> >  F: drivers/i2c/i2c-stub.c
> >
> > +I3C DRIVER FOR AMD AXI I3C MASTER
> > +M: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> > +R: Michal Simek <michal.simek@amd.com>
> > +S: Maintained
> > +F: Documentation/devicetree/bindings/i3c/xlnx,axi-i3c.yaml
> > +F: drivers/i3c/master/amd-i3c-master.c
> > +
> >  I3C DRIVER FOR ASPEED AST2600
> >  M: Jeremy Kerr <jk@codeconstruct.com.au>
> >  S: Maintained
> > diff --git a/drivers/i3c/master/Kconfig b/drivers/i3c/master/Kconfig
> > index 13df2944f2ec..4b884a678893 100644
> > --- a/drivers/i3c/master/Kconfig
> > +++ b/drivers/i3c/master/Kconfig
> > @@ -1,4 +1,20 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +
> > +config AMD_I3C_MASTER
> > +   tristate "AMD I3C Master driver"
> > +   depends on I3C
> > +   depends on HAS_IOMEM
> > +   help
> > +     Support for AMD I3C Master Controller.
> > +
> > +     This driver allows communication with I3C devices using the AMD
> > +     I3C master, currently supporting Standard Data Rate (SDR) mode.
> > +     Features include Dynamic Address Assignment, private transfers,
> > +     and CCC transfers in both broadcast and direct modes.
> > +
> > +     This driver can also be built as a module.  If so, the module
> > +     will be called amd-i3c-master.
> > +
> >  config CDNS_I3C_MASTER
> >     tristate "Cadence I3C master driver"
> >     depends on HAS_IOMEM
> > diff --git a/drivers/i3c/master/Makefile b/drivers/i3c/master/Makefile
> > index aac74f3e3851..109bd48cb159 100644
> > --- a/drivers/i3c/master/Makefile
> > +++ b/drivers/i3c/master/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0-only
> > +obj-$(CONFIG_AMD_I3C_MASTER)               += amd-i3c-master.o
> >  obj-$(CONFIG_CDNS_I3C_MASTER)              += i3c-master-cdns.o
> >  obj-$(CONFIG_DW_I3C_MASTER)                += dw-i3c-master.o
> >  obj-$(CONFIG_AST2600_I3C_MASTER)   += ast2600-i3c-master.o
> > diff --git a/drivers/i3c/master/amd-i3c-master.c
> > b/drivers/i3c/master/amd-i3c-master.c
> > new file mode 100644
> > index 000000000000..c89f7de85635
> > --- /dev/null
> > +++ b/drivers/i3c/master/amd-i3c-master.c
> > @@ -0,0 +1,1012 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * I3C master driver for the AMD I3C controller.
> > + *
> > + * Copyright (C) 2025, Advanced Micro Devices, Inc.
> > + */
> > +
>
> ...
>
> > +
> > +static inline int xi3c_master_common_xfer(struct xi3c_master *master,
> > +                                     struct xi3c_xfer *xfer)
> > +{
> > +   int ret, timeout;
> > +
> > +   guard(mutex)(&master->lock);
> > +
> > +   xi3c_master_enqueue_xfer(master, xfer);
> > +   timeout = wait_for_completion_timeout(&xfer->comp,
> > +                                         XI3C_XFER_TIMEOUT_JIFFIES);
>
> Recent patch use time_left instead of timeout.
We will update.
>
> > +   if (!timeout)
> > +           ret = -ETIMEDOUT;
> > +   else
> > +           ret = xfer->ret;
> > +
> > +   if (ret)
> > +           xi3c_master_dequeue_xfer(master, xfer);
> > +
> > +   return ret;
> > +}
> > +
> > +static int xi3c_master_do_daa(struct i3c_master_controller *m) {
> > +   struct xi3c_master *master = to_xi3c_master(m);
> > +   struct xi3c_cmd *daa_cmd;
> > +   struct xi3c_xfer *xfer;
>
> struct xi3c_xfer __free(kfree) *xfer;
> will simple err path.
We will fix.
>
> > +   u8 pid_bufs[XI3C_MAX_DEVS][8];
> > +   u8 data, last_addr = 0;
> > +   int addr, ret, i;
> > +   u8 *pid_buf;
>
> try keep reverise christmas tree order
We will fix.
> > +
> > +   xfer = xi3c_master_alloc_xfer(master, 1);
>
> only 1 xfer, needn't alloc from heap. Just use stack varible should be enough.
xi3c_master_alloc_xfer() handles both memory allocation and structure initialization. If we replace it with a stack variable in this case, we would need to duplicate the initialization logic in several places. Using the helper keeps the code consistent and avoids repetition.
>
> > +   if (!xfer) {
> > +           ret = -ENOMEM;
> > +           goto err_daa_mem;
> > +   }
> > +
> > +   for (i = 0; i < XI3C_MAX_DEVS; i++) {
> > +           addr = i3c_master_get_free_addr(m, last_addr + 1);
> > +           if (addr < 0) {
> > +                   ret = -ENOSPC;
> > +                   goto err_daa;
> > +           }
> > +           master->daa.addrs[i] = (u8)addr;
> > +           last_addr = (u8)addr;
> > +   }
> > +
> > +   /* Fill ENTDAA CCC */
> > +   data = I3C_CCC_ENTDAA;
> > +   daa_cmd = &xfer->cmds[0];
> > +   daa_cmd->addr = I3C_BROADCAST_ADDR;
> > +   daa_cmd->rnw = 0;
> > +   daa_cmd->tx_buf = &data;
> > +   daa_cmd->tx_len = 1;
> > +   daa_cmd->type = XI3C_SDR_MODE;
> > +   daa_cmd->tid = XI3C_SDR_TID;
> > +   daa_cmd->continued = true;
> > +
> > +   ret = xi3c_master_common_xfer(master, xfer);
> > +   /* DAA always finishes with CE2_ERROR or NACK_RESP */
> > +   if (ret && ret != I3C_ERROR_M2) {
> > +           goto err_daa;
> > +   } else {
> > +           if (ret && ret == I3C_ERROR_M2) {
> > +                   ret = 0;
> > +                   goto err_daa;
> > +           }
> > +   }
> > +
> > +   master->daa.index = 0;
> > +
> > +   while (true) {
> > +           struct xi3c_cmd *cmd = &xfer->cmds[0];
> > +
> > +           pid_buf = pid_bufs[master->daa.index];
> > +           addr = (master->daa.addrs[master->daa.index] << 1) |
> > +                  (u8)(!parity8(master->daa.addrs[master->daa.index]));
> > +
> > +           cmd->tx_buf = (u8 *)&addr;
> > +           cmd->tx_len = 1;
> > +           cmd->addr = I3C_BROADCAST_ADDR;
> > +           cmd->rnw = 1;
> > +           cmd->rx_buf = pid_buf;
> > +           cmd->rx_len = XI3C_DAA_SLAVEINFO_READ_BYTECOUNT;
> > +           cmd->is_daa = true;
> > +           cmd->type = XI3C_SDR_MODE;
> > +           cmd->tid = XI3C_SDR_TID;
> > +           cmd->continued = true;
> > +
> > +           ret = xi3c_master_common_xfer(master, xfer);
> > +
> > +           /* DAA always finishes with CE2_ERROR or NACK_RESP */
> > +           if (ret && ret != I3C_ERROR_M2) {
> > +                   goto err_daa;
> > +           } else {
> > +                   if (ret && ret == I3C_ERROR_M2) {
> > +                           xi3c_master_resume(master);
> > +                           master->daa.index--;
> > +                           ret = 0;
> > +                           break;
> > +                   }
> > +           }
> > +   }
> > +
> > +   kfree(xfer);
> > +
> > +   for (i = 0; i < master->daa.index; i++) {
> > +           i3c_master_add_i3c_dev_locked(m, master->daa.addrs[i]);
> > +
> > +           u64 data = FIELD_GET(XI3C_PID_MASK,
> > +get_unaligned_be64(pid_bufs[i]));
> > +
> > +           dev_info(master->dev, "Client %d: PID: 0x%llx\n", i, data);
> > +   }
> > +
> > +   return 0;
> > +
> > +err_daa:
> > +   kfree(xfer);
> > +err_daa_mem:
> > +   xi3c_master_reinit(master);
> > +   return ret;
> > +}
> > +
>
> > +static int xi3c_master_send_bdcast_ccc_cmd(struct xi3c_master *master,
> > +                                      struct i3c_ccc_cmd *ccc)
> > +{
> > +   u16 xfer_len = ccc->dests[0].payload.len + 1;
> > +   struct xi3c_xfer *xfer;
> > +   struct xi3c_cmd *cmd;
> > +   int ret;
> > +
> > +   xfer = xi3c_master_alloc_xfer(master, 1);
> > +   if (!xfer)
> > +           return -ENOMEM;
>
> the same here. use struct xi3c_xfer xfer should be more simple.
Same reasoning as mentioned above - xi3c_master_alloc_xfer() handles both allocation and initialization, avoiding code duplication.

> > +
> > +   u8 *buf __free(kfree) = kmalloc(xfer_len, GFP_KERNEL);
> > +   if (!buf) {
> > +           kfree(xfer);
> > +           return -ENOMEM;
> > +   }
> > +
> > +   buf[0] = ccc->id;
> > +   memcpy(&buf[1], ccc->dests[0].payload.data,
> > +ccc->dests[0].payload.len);
> > +
> > +   cmd = &xfer->cmds[0];
> > +   cmd->addr = ccc->dests[0].addr;
> > +   cmd->rnw = ccc->rnw;
> > +   cmd->tx_buf = buf;
> > +   cmd->tx_len = xfer_len;
> > +   cmd->type = XI3C_SDR_MODE;
> > +   cmd->tid = XI3C_SDR_TID;
> > +   cmd->continued = false;
> > +
> > +   ret = xi3c_master_common_xfer(master, xfer);
> > +   kfree(xfer);
> > +
> > +   return ret;
> > +}
> > +
> ...
> > +static struct platform_driver xi3c_master_driver = {
> > +   .probe = xi3c_master_probe,
> > +   .remove = xi3c_master_remove,
> > +   .driver = {
> > +           .name = "axi-i3c-master",
> > +           .of_match_table = xi3c_master_of_ids,
> > +   },
> > +};
> > +module_platform_driver(xi3c_master_driver);
> > +
> > +MODULE_AUTHOR("Manikanta Guntupalli <manikanta.guntupalli@amd.com>");
> > +MODULE_DESCRIPTION("AXI I3C master driver");
> MODULE_LICENSE("GPL");
> > --
> > 2.34.1
> >

Thanks,
Manikanta.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
