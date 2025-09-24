Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66141CAC5A5
	for <linux-i3c@archiver.kernel.org>; Wed, 24 Sep 2025 10:12:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TUFkj5/LjONCqpQr41bQAb85G5MVQ+yCD0PuHzy9u0=; b=GDZb494xPXBTPL
	3c4uMxs4YKzws0wk0rW5MbPc9SsaNMyC6E/9JK7sPYJ17BHxIzroyvLAIUvHqRvxcQ+iTmfK7rHcP
	LveiXYOejIs/s0NmYh0ExjtJ930VZLh0YIjanFY3GrVXhmO0fW05P6RmDTVSIoAeJr5qykUBQgHIY
	1Pf9qnjZ1sJN2hK0JQ0tFGaJCaqiJ40N7tMCKKDGjQ/wkHg+Rf5gtsgReOQ5PwgjeQi7KXM7qbGF5
	VUSWp8nwxy5cCN9Xo9wD3YPPUmhbvrbYXEvy8bnjZY34aaKAkGdeTAhYfN/5ZU+EZFKr4sN1eHmgS
	lbJfZyNPjn9GkYiRWNBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MUQ-0000000GO1t-0axZ;
	Wed, 24 Sep 2025 10:12:46 +0000
Received: from mail-westus2azlp170100005.outbound.protection.outlook.com ([2a01:111:f403:c005::5] helo=CO1PR03CU002.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1MUN-0000000GNyS-0xpI
	for linux-i3c@lists.infradead.org;
	Wed, 24 Sep 2025 10:12:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wEqBCLVaYcTt+7E2GpsyE0yi6p4EE+/aXz1Aa0l2KCqvkPByOVm0eihz7xgkhW4ruzbBDBn/V4givzzmeSzHwPTG1gGAVtLbzM8InVdUWa431T3I11M3bEzcgbti9muaD6/wcEd88GOtWWUdqXfdMewtBn/93XR5zhOA8wVItpy8gnCfSDQzznbnJZjgW6BNLJ2EMQfncFXyxIp1DnRhiWnijT+uDxMdb7VIh4vli/C75bohMVixOJ2ItLU9Y46j8X5tNcd6+VRkr6HQzFllV4EMHSvEfdSHT/al0eNHWzP9t21UdQkRkHRg7lExk+kpOOTqtl8fqe+yl35GNTOenw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0VnvIeByqm7wDK0ZQ1hAjwMNJwOxapW3JaogSlAJI14=;
 b=vQ+snOSy148qxYWpz/KSAeHlHQzh8P5hE6g+1FQXnYtTdDLiL6rlA5tK48gfl1PfzbIczDTjOwbQPVv7ijnhxaRFKpPHYyYESn+XYjoM3OQCX5IqYCiB9Ol4nuh8OozYkU43DlVu337k/TgKrOXz2T0nOpXdWbZH+abQnDijtYGZqIMPLF+0jFP4SLjWjEI3KyMtqj2+waq2wswuDatTgNU5CctHrJKysQjKN/HqyXl3QvaJRCQZaVic/dgXEdl173JrECbKodUOblyD11p2Rx1xeoE7uXoV5FNAvbw3whebUZ+R+SdaiREBXshhpeQFUCor/kJNl3SBjVIzs0QGJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0VnvIeByqm7wDK0ZQ1hAjwMNJwOxapW3JaogSlAJI14=;
 b=eRCdVXscnC6bsinm2PDWDWJi+nKKwEsw+3JH29+i7kbIhO43DAmZkZLv4xFuAgE3gDen0KGdjX/oKDwLbYmq1Eqs9t0QOfEp8GjGooPlna1Ar4iiqEp1An/8GJV600MCQUEHjdeqzdZGtpr65x4vJer8uFmrIEg3Wg0Sqz8EdS0=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 MW4PR12MB6921.namprd12.prod.outlook.com (2603:10b6:303:208::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.19; Wed, 24 Sep 2025 10:12:32 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%4]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 10:12:31 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: Arnd Bergmann <arnd@arndb.de>, "git (AMD-Xilinx)" <git@amd.com>, "Simek,
 Michal" <michal.simek@amd.com>, Alexandre Belloni
	<alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, Rob Herring
	<robh@kernel.org>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, =?iso-8859-2?Q?Przemys=B3aw_Gaj?= <pgaj@cadence.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"tommaso.merciai.xr@bp.renesas.com" <tommaso.merciai.xr@bp.renesas.com>,
	"quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
	"'billy_tsai@aspeedtech.com'" <billy_tsai@aspeedtech.com>, Kees Cook
	<kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Jarkko
 Nikula <jarkko.nikula@linux.intel.com>, Jorge Marques
	<jorge.marques@analog.com>, "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>,
	"linux-hardening@vger.kernel.org" <linux-hardening@vger.kernel.org>
CC: "Pandey, Radhey Shyam" <radhey.shyam.pandey@amd.com>, "Goud, Srinivas"
	<srinivas.goud@amd.com>, "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
	"manion05gk@gmail.com" <manion05gk@gmail.com>
Subject: RE: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
Thread-Topic: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accessors
Thread-Index: AQHcLKFYs7kre3e43EuQ9LsQHTc3m7ShGSCAgADudtCAAA9DgIAABNog
Date: Wed, 24 Sep 2025 10:12:31 +0000
Message-ID: <DM4PR12MB61095488B6E37E30A43C03498C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250923154551.2112388-1-manikanta.guntupalli@amd.com>
 <20250923154551.2112388-3-manikanta.guntupalli@amd.com>
 <cde37e36-4763-48ca-a038-4a19eb1ef914@app.fastmail.com>
 <DM4PR12MB610982CB7D66D9DEF758188E8C1CA@DM4PR12MB6109.namprd12.prod.outlook.com>
 <77978246-11c0-4cea-8a22-26536a78eef1@app.fastmail.com>
In-Reply-To: <77978246-11c0-4cea-8a22-26536a78eef1@app.fastmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-24T10:03:39.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|MW4PR12MB6921:EE_
x-ms-office365-filtering-correlation-id: 8fcfa532-8ce6-4f01-120b-08ddfb52dfe7
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|921020|38070700021;
x-microsoft-antispam-message-info: =?iso-8859-2?Q?TPeshaHy0c6PaBNdkiOcYhLMxSVTvmPJg32UfoU/96xbUC5hXqO6APj9Bi?=
 =?iso-8859-2?Q?q2yCJb+LXPOp8jloE1uoaXDRk/8ax66Cb+hIkgn1uR/xdEPAKM1WFf0mo3?=
 =?iso-8859-2?Q?7cWluY5zC0zq+6Px2gJiE0f+BAIXrv8Y01ym28SE2Qw8v483nauLqNBsKX?=
 =?iso-8859-2?Q?DOhtTvOpjVJaEz/ky2YY1JXu4MBn/vyscJchzFT13pue/YtjQjjV1CjPGo?=
 =?iso-8859-2?Q?VqB2wAeg+GNltK9+RPX+b61pwL9oGlbvd0wzTK0C4Z1M9SOzXvSrE3/Rwu?=
 =?iso-8859-2?Q?LBxjX12xDz4QEMgbUFpGxoWq/dvnszlkIINF0Zd5gA5vvCnZ3QBMVhoyJ4?=
 =?iso-8859-2?Q?k4x+r+sfCT3c2QTM4vyEhP4DdMcuFnQ88owJkmtHQ9Z9hlr+Kc/U9HA/ga?=
 =?iso-8859-2?Q?udVBIOVJwfNZz+T0zR/m4up+Bjs7Qv+7gjo/j4+/a194KS/WjzVg/DnIxD?=
 =?iso-8859-2?Q?LzMKQSlBPsoJJoweauQ09MS9xUillSPpKFz8f8HC7OxhRtE5u79fv4XFQb?=
 =?iso-8859-2?Q?+tMIy55ZQxVqYc+8H4BIgQqNiHxVhqGP3sJO0CPy3QgXiIRyBqZucGRUlq?=
 =?iso-8859-2?Q?3D3UfKkwElTCe98fTm9vvUDfWEuiNJZK3+oRPT+Mtl6DzgAfJviX6gqqb6?=
 =?iso-8859-2?Q?El3YGKWJIPPesVXMqtu5OMtpMKx1XRivgliwGSOZvDtSfV2+0WcUc51vHb?=
 =?iso-8859-2?Q?JOsalAlWZJYfWq4u6z4r8TyLJJTYjrSvpKbrSEmAKleC/oqrKTznEZKAC5?=
 =?iso-8859-2?Q?Bhc+vVtLN97HuzXy/UOaVytKCIIzEOlQsBX9e/u0RFKMLiEjyJbEGPn7o/?=
 =?iso-8859-2?Q?SXbza7eDW1/5pO6+obClciBOrxCouk4kKiXQHyJZFWBwhNSOlFK3w0s5Wi?=
 =?iso-8859-2?Q?C7YqVMlwkXD3nvXEtE4ZxU5PpDhq8YtH7qiUI2I4TiIJ/FF0A28f95qMmN?=
 =?iso-8859-2?Q?w/tpEu4hxTL36mfk/bZoawcWuJ7JH91JRvMWXJLikUrqn3en/U/ynRBzBR?=
 =?iso-8859-2?Q?xShOB1EZoQNNTgflonB1uuim6TTAtQVcOBK+kLFpwEwaGUtRSHycUBAE1Y?=
 =?iso-8859-2?Q?t9yKJknz3Yj8J6r7KdFX0j+fcVB04U82swxSn2W1k7U1wW94WncPQivVZa?=
 =?iso-8859-2?Q?c3oueu4oGX/CWHseJxlsnjeTAhEy6iON2sLtz/c5RA53qU5/rwBlmAdIuf?=
 =?iso-8859-2?Q?GNwhDMrPMXmyKHVsH3X8do3w2Jw75/muMg2CEremJlxSj5z/+BxiMYTHJY?=
 =?iso-8859-2?Q?1Izh5kC4kOE3gKA4HT31bbtk0qF66583jdRPShnAAHujD7cUtZMyT+kWYl?=
 =?iso-8859-2?Q?4ZHl+SBmTCEVMNf4U8iS+vhrVZ8ydzd79+QPHccmg48ffF8i9f97IOBNKJ?=
 =?iso-8859-2?Q?0y27vkhbZOPVKuBQCB8QctrQEHl6DeLANkOq7k4wR4//K/9xNf3PJx7T6X?=
 =?iso-8859-2?Q?0mSWIZNvOCyl2BUk2ns21Ea9NBQlsK90xT9zAjRCkesrLndteh4rxacbwh?=
 =?iso-8859-2?Q?C+MugaFcDBhwqDwQr8l0zfcYuczHKgEe30DXLg5zezyHIDX/2jyyfwNk2H?=
 =?iso-8859-2?Q?6+GakTLa1e/aq/9fbtifXA7D35Fu?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-2?Q?U/JKkA72OJoD2SYwCej5hfdWYHgDmL6D2B5IMobULHc9e67X3TMcHH3CK+?=
 =?iso-8859-2?Q?AGzgIWRW0oLpiVQa0TgbmNUcKHv3SpB25KQghoBWRkCoAaBqzxS56i/ke1?=
 =?iso-8859-2?Q?MtCbak1JisDyDUkRWAodz7qbu8nGF2nP762QG+uRLbHWDuIIOLPbWRis+U?=
 =?iso-8859-2?Q?RyH+UIPWORErwZO26ZS6n+Gwn90hqJjrYIBS/7EdQ3ZxfeBIu+8aBwWfaa?=
 =?iso-8859-2?Q?LS0k68EeDPKqcyI0bCELsDizK2kTiuN/nskmFTDyjmUi8SpwPFBus5rNaK?=
 =?iso-8859-2?Q?vkthmzCHffWJAtz19I23OvRGTaGwdvXgYjiFxdXJfhuRIcqmuwN2sORrE7?=
 =?iso-8859-2?Q?HnVDyYXMZUqBqHMzFrDJYxLbgQNFRTbapZjlFFHFXAHEbD2OVzbRtpn2mY?=
 =?iso-8859-2?Q?+SR6x5zKh3M1vqTwjBgGlrDmKOUwNdOazLsId3fIQP1RxfnwKcMyeZAzzY?=
 =?iso-8859-2?Q?fSmaCUOI1o02uvL59z+dXH+qGksBxnbW9VyQOncsACBUhWEizFVjrny4U6?=
 =?iso-8859-2?Q?xGDEVnam2rKakt2NFCzgSrPGdG+a0Orm2yFmqh8qGSYgqPMh8daojXRwwk?=
 =?iso-8859-2?Q?RgWCNAxZtbjkuHh97CL1fyAHcTtV+4lBMKc3eq+zcrDNdsjAMv+IfnfrSN?=
 =?iso-8859-2?Q?sQ0qm6hONMoNHHBoZ+pz2MqB2prfeQAfi2wKlxFWzXLvyDcV2nvD/f0glo?=
 =?iso-8859-2?Q?RUvpd8SYeQJAmrT0HKnipPlzGsZIIoOIbZtt3warxvxtKWeSOWKIaRKlQi?=
 =?iso-8859-2?Q?SBBCyQUfhhYQcgAA6qRTLX89QIE27L/wl7At9mGH8by1jCyDTJsNmVT6wo?=
 =?iso-8859-2?Q?0IJkrq/fMv7mh7Kf6WPA/UUhvkpWeQtGo1KP+lub8CTp8mVEADLuuHsk5I?=
 =?iso-8859-2?Q?kaPjyIverayG4wlJ2M2SZx3CsaA6zWDb6MM29uFhmgPY7yGjipGc/SHVdg?=
 =?iso-8859-2?Q?FXC+7uvryZ9b0MKO4N3JPNXkIkXphCzYs6xVQcE7TlToeW85Hl5zybHXiT?=
 =?iso-8859-2?Q?jJqDlyH3o0yrX1H4y4bydnRnDiwJslgaorTbMflkTs26vIsvsEMZ3nUJRk?=
 =?iso-8859-2?Q?OWt3j2SYPefhkeVQ69bJii1JQ1Xc7I6rGS5Un3HhDNoM9UJlgFabHY5BNL?=
 =?iso-8859-2?Q?gg8Dfzd9N9/Ral9AKCdgGoxXSmthjJNt6EptdcBknJFx9qpFxcZPXFHhmf?=
 =?iso-8859-2?Q?d6Ve58WjeQXva9qiWlhZt0fFfSpQYzv6LQX+TUW4AoXJ27DlOaAKKyhvFu?=
 =?iso-8859-2?Q?C7xT9oTbr/QqzuwPV5J58KffrLKUP58ULwddaj1wDbAT71L3R+HnlVuAgF?=
 =?iso-8859-2?Q?C3JhimzOqMuOj91pXXIaMqUEcI6AGUa9TY7B0FDYhftAfoFymA8CyKNnKa?=
 =?iso-8859-2?Q?ttkPlqLOQXJ+HhUmZOL/Tj3Hi/00Hp7zmDAckkM+PqoJ4n/PY90cqVvoSY?=
 =?iso-8859-2?Q?UDYESTHSWeNaIJHY0R73wXXDIYWNPRJ2fZUN1NHDdGY/mgKvvqxM0adpC4?=
 =?iso-8859-2?Q?AlElvfhmOQGf54S8wDKSAfRhL4l7rUbCGOVZ91/xWroiew5dFICiSDE7WI?=
 =?iso-8859-2?Q?xqqvxzEAwVsKoFT8+EL9PwjDU5hLydW8ShW6T4EoLse7j7jhgjE4VGrcHD?=
 =?iso-8859-2?Q?TzbXPK2jhSa54=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8fcfa532-8ce6-4f01-120b-08ddfb52dfe7
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2025 10:12:31.8629
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JQ3q5rNx3dNghNQZnuJ6wmKo79GOLtIuBCpR7yzHVWZRBZ41RlXmK7Aa0QUehkCOkomN9Ue4fO3/eYB0D+MaNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6921
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_031243_403612_9740D5C3 
X-CRM114-Status: GOOD (  17.53  )
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
Content-Type: text/plain; charset="iso-8859-2"
Content-Transfer-Encoding: quoted-printable
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

[Public]

Hi,

> -----Original Message-----
> From: Arnd Bergmann <arnd@arndb.de>
> Sent: Wednesday, September 24, 2025 3:16 PM
> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; git (AMD-Xilinx)
> <git@amd.com>; Simek, Michal <michal.simek@amd.com>; Alexandre Belloni
> <alexandre.belloni@bootlin.com>; Frank Li <Frank.Li@nxp.com>; Rob Herring
> <robh@kernel.org>; krzk+dt@kernel.org; Conor Dooley <conor+dt@kernel.org>;
> Przemys=B3aw Gaj <pgaj@cadence.com>; Wolfram Sang <wsa+renesas@sang-
> engineering.com>; tommaso.merciai.xr@bp.renesas.com;
> quic_msavaliy@quicinc.com; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>;
> Sakari Ailus <sakari.ailus@linux.intel.com>; 'billy_tsai@aspeedtech.com'
> <billy_tsai@aspeedtech.com>; Kees Cook <kees@kernel.org>; Gustavo A. R. S=
ilva
> <gustavoars@kernel.org>; Jarkko Nikula <jarkko.nikula@linux.intel.com>; J=
orge
> Marques <jorge.marques@analog.com>; linux-i3c@lists.infradead.org;
> devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Linux-Arch <lin=
ux-
> arch@vger.kernel.org>; linux-hardening@vger.kernel.org
> Cc: Pandey, Radhey Shyam <radhey.shyam.pandey@amd.com>; Goud, Srinivas
> <srinivas.goud@amd.com>; Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>;
> manion05gk@gmail.com
> Subject: Re: [PATCH V7 2/4] asm-generic/io.h: Add big-endian MMIO accesso=
rs
>
> On Wed, Sep 24, 2025, at 10:59, Guntupalli, Manikanta wrote:
> >> From: Arnd Bergmann <arnd@arndb.de>
> >> Sent: Wednesday, September 24, 2025 12:08 AM
> >> To: Guntupalli, Manikanta <manikanta.guntupalli@amd.com>; git
> >> (AMD-Xilinx)
> >
> > From both description and implementation, {read,write}{b,w,l,q}()
> > access little-endian memory and return the result in native endianness:
> ...
> > This works on little-endian CPUs, but on big-endian CPUs the
> > {read,write}{b,w,l,q}() helpers already return data in big-endian
> > format.
>
> > The extra byte swap in io{read,write}*be() therefore corrupts the
> > data, producing little-endian values when big-endian is expected.
>
> > The newly introduced {read,write}{w,l,q}_be() helpers directly access
> > big-endian IO memory and return results in native endianness, avoiding
> > this mismatch.
>
> No, in both your {read,write}{w,l,q}_be() and the existing io{read,write}=
*be() helpers,
> big-endian platforms end up with an even number of swaps
> (0 or 2), while little-endian platforms have exactly one swap.
>
> The only exception is your {read,write}s{w,l,q}_be() string helpers that =
are wrong
> because they have an extra swap and are broken on FIFO registers in littl=
e-endian
> kernels.
We have performed our validation on little-endian kernels, and in our testi=
ng, the helpers worked correctly without any issues.

Thanks,
Manikanta.

-- =

linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
