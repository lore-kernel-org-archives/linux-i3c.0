Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 632ADCAC59C
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VEhhEkoY6dYGOj0k/lRhHUR1IZ4ZzUVbUAhIGk1Y+k=; b=eeUsUEYFQofUJN
	uKUMiE8jwZKiZecQS8cajI585rQfQbJQ/bfytvMS+VStdVKoxOosKjJzDi1ixydai9rq/va6pfoRN
	VB5bru+GM6cn+WO22stcKkjlNtVItysUvgoKB+OZCZrkGZLokkdefD2Uv+zIGnFZMR1GRAIvhqQDJ
	mSYdyeIW5Mh9H1WZboXAD/u2MuYHqRW9PsZbOX/pEsxq91zvnOICQX0baWLfCNSf1DjQR/EGyOSUG
	vsqz9AwKoWcrQoNWeGUzG4qhtYhwjyKlcFgjXPSQLYypHVlIsroddaKNpiaOJW9JIq4C/9N4RJ0/7
	YJl2mAKy6aU8kIUoxI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtPe-000000029nk-0ZQQ;
	Sun, 14 Sep 2025 20:33:30 +0000
Received: from mail-dm6nam12on2062b.outbound.protection.outlook.com ([2a01:111:f403:2417::62b] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uszHJ-0000000BTuD-30Ic
	for linux-i3c@lists.infradead.org;
	Mon, 01 Sep 2025 07:48:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RufJQLGFler0qu/ge89kwTW0N8DTDd+7+zImf50i9MVTcu7zVdzsR+uxSib12oU7qXQdvpWaWk+Qb0BmsOP8sKaS1Q3f5IBeWZZapSQPmWGtAbTqJzRUXFiqev7poz+xGnG4l+aCGgSfJuhEqa3SyzgLLIPA2C1FdT50tALrsnyPY098/k3zxpgtjBhHPaMCumQewPqmx5IhD8uCReIPlQhcxM/394m7L2as+FP6FSwrxcIjwIaKyfX9vwiJN6/2BY2QZej+Y5+RCxUBb1ozGWQn+S8IJYELaBSAaeM3SRVphGAXOorDgd9tHNjUGP60NL6yHBKxUNWpDMVN3m6uHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=30ow4nNnWuMZNL3dytWbD35ktbCLYRT8MMK0K9uOr7E=;
 b=WlZVOaB7wjRepiM36sqfTKfZHIEJoIlHvG/uYITxJj4h+srKFiFXSA3ZCctGwLg1HtiAiFbUSlZRMT0caXp3HhMrkKGYdebD+FIzAQNlohk8YIKtvx5N12kY87jniK9uzxuu5ArqBaxAvgi+BSCWIeqJTbmeBs7D7hROgyj5oWn6tEaCLqhTmvFU5+fwG7rz2iPTI1cvHkyGhHCQfrCrafHDVJPjwGLWIPauS2CKcaaJgTadkN57osGEP+XmK/s7KRyyMBUPnbFKuFfz4JMZK8vzxC87gcvO6/QbTrPZPPjZwcKn80W4kI2Ow401NBXvkr6qQGteSlYyXv28CUc8bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=30ow4nNnWuMZNL3dytWbD35ktbCLYRT8MMK0K9uOr7E=;
 b=3D3dY9Lu3Dtr93dUot+SZ5DjwRgPH+97Ro0KCIRlO50IIry/eFP5QUshNAUbz2GbpEbXt0aRR65cN8pEHexiCbjpVZRbPzUX8JrkI/B1aGl7gqh5IlowpplhOgYVkOE7tf6b+6XO+5auVmS5YgnwE6INOlaJbxpzifhQrZ6vqmU=
Received: from DM4PR12MB6109.namprd12.prod.outlook.com (2603:10b6:8:ae::11) by
 MN2PR12MB4375.namprd12.prod.outlook.com (2603:10b6:208:24f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.28; Mon, 1 Sep
 2025 07:48:27 +0000
Received: from DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1]) by DM4PR12MB6109.namprd12.prod.outlook.com
 ([fe80::680c:3105:babe:b7e1%7]) with mapi id 15.20.9052.024; Mon, 1 Sep 2025
 07:48:27 +0000
From: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>
To: "Guntupalli, Manikanta" <manikanta.guntupalli@amd.com>, "git (AMD-Xilinx)"
	<git@amd.com>, "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>, "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
	"wsa+renesas@sang-engineering.com" <wsa+renesas@sang-engineering.com>,
	"quic_msavaliy@quicinc.com" <quic_msavaliy@quicinc.com>, "S-k, Shyam-sundar"
	<Shyam-sundar.S-k@amd.com>, "xiaopei01@kylinos.cn" <xiaopei01@kylinos.cn>,
	"billy_tsai@aspeedtech.com" <billy_tsai@aspeedtech.com>,
	"linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC: "Simek, Michal" <michal.simek@amd.com>, "Pandey, Radhey Shyam"
	<radhey.shyam.pandey@amd.com>, "Goud, Srinivas" <srinivas.goud@amd.com>,
	"Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>, "manion05gk@gmail.com"
	<manion05gk@gmail.com>
Subject: RE: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
Thread-Topic: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
Thread-Index: AQHcAWRgHgzNuWUIgkCsDHVkviqO2LR+JTFA
Date: Mon, 1 Sep 2025 07:48:27 +0000
Message-ID: <DM4PR12MB610977A84E60005E87C1B45D8C07A@DM4PR12MB6109.namprd12.prod.outlook.com>
References: <20250730151207.4113708-1-manikanta.guntupalli@amd.com>
In-Reply-To: <20250730151207.4113708-1-manikanta.guntupalli@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Enabled=True;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_SetDate=2025-09-01T07:42:56.0000000Z;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Name=Open
 Source;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_ContentBits=3;MSIP_Label_f265efc6-e181-49d6-80f4-fae95cf838a0_Method=Privileged
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR12MB6109:EE_|MN2PR12MB4375:EE_
x-ms-office365-filtering-correlation-id: 75b36c27-7ed3-4a47-0195-08dde92befc8
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|376014|366016|921020|38070700018|7053199007;
x-microsoft-antispam-message-info: =?us-ascii?Q?DgOk2+gapfxteCeV1T9HK1NM7Zu2EdUS7F3X7/W3BhdG2l8wDmZK7XG26uJK?=
 =?us-ascii?Q?PSQkRoiDrVX5kgLawx+4BE03IvcF/kmhybW0MOTJ91QuECHwuijXhTGHyaOx?=
 =?us-ascii?Q?fVt77sI38ub7sedR7Oi4XsMLNugAd2KYNSGdGbX98z3kT5OKLG4sMRyIJvBe?=
 =?us-ascii?Q?CGJuYCXQhhv0Ww3x5HITF5DuOUXjsXhewCMBrzj1z17RL3scnPT2nJBOaus2?=
 =?us-ascii?Q?j5BE4cBsbxZMxDXuz+p0wnQdLWdvjEGRyy39oKiPwgm2qQ4gBAG6k4jJ/L2F?=
 =?us-ascii?Q?EGWDdGx/e5Y4bqZgtI2iwRp5inCO8C/l/7T2hlRDjdqT0wFDs0NII+HPsHDy?=
 =?us-ascii?Q?E8G433slUT7Kt2IrBpcSPqDFTas3AR592p+pjOv4lY69vLbIDtDUu/741XVy?=
 =?us-ascii?Q?0FFLlN6xwZvFUMfv9ulkrprH9jeWZnmcUJXUQ9t+vf2vTXPFksV2BtyhfKqy?=
 =?us-ascii?Q?PgHh0QE4wiw2kKVTu6zJkIAP5CA5QToVuJm4bBu6BJRmS9o6BDGOWWPAy+0o?=
 =?us-ascii?Q?pKImr4ZdVUX311FkENAqK7SMQSZqk3puKg+HOk+r23A5oviVyc8geFLMMaak?=
 =?us-ascii?Q?J+ZYyKNhAmPQvk1Mhm9VornoX15rp18jhkZFTTrB7LkIPxxbOMSSDIRMrhYz?=
 =?us-ascii?Q?fcJdLxa2b+0TOrq6AITTsKIzIrYc2yKDZJzMhAbNxCl5N+gIEZlxE6mibnWY?=
 =?us-ascii?Q?G4ZK+FZzqKK7hemwRySNbduEkZ4WfoIhNgPYkO9qI57ftgE41NaBQCvJFxFt?=
 =?us-ascii?Q?G1WNlAshRIFXfM0S/hLX0z7DEH5vXz3X/z9lkCjZDmYpyXR8yH4nYuTAZJl8?=
 =?us-ascii?Q?qr3kBZoOcVkwK8Nk1CpIyTO90At61mEg400z4Dy6+ZhSxOx+z6PeU0g1vIgN?=
 =?us-ascii?Q?LqvZuZ2H2JNvoVhBO867gs91F4MBU1U4oguPXeWof6nZCNQY79Vx8YzAw4r8?=
 =?us-ascii?Q?+wn/RWk8qyNlr6Q0JD5OHkdL1+VJ+DWYjtLEDj+/JIBCH+MeAxO0gtq3d6Jn?=
 =?us-ascii?Q?NYbHAzWSdGLOBqx2BerNjPvRH/4xudP9bFRr7HMk5srYkXfWtWi9SxUecSO1?=
 =?us-ascii?Q?ogs6N7VuY9mgawzu0jlvm6dvCpRDVwglHesllJ0BqtKKYp+NkQIXKUFvWAvx?=
 =?us-ascii?Q?Lh5B14EA+FhUe3xl/N4LDd/DoJYB5daZ+KtNzZ6TFMFjNOEfHj+WmpBXRoNW?=
 =?us-ascii?Q?2rmpoTM53/jJOZ0gmOCdiAV+FgU+4ueJ7fXMYe3VPzoEDJlsHhZ+oH3SJa63?=
 =?us-ascii?Q?hUOH+7UelxM9hRTlRkR1NhHQchLs0IMYZfWYo6IjtLISl2LXs4L6OZjBiUgi?=
 =?us-ascii?Q?lhpmiwTtVYH2vsJIMJi5S9jG+EV8/Iypvu6G60PmWVXy5Wfj7VJCAUod8k8d?=
 =?us-ascii?Q?lYLHNJ1hl/bKNh42MUb/K7kcNYqGDkdqarysinK5dOuNKe3wBapV/FD64k4M?=
 =?us-ascii?Q?ROWLRNtWQr2QEFOR1wY2jFH4nklPJmiicBlR6gOqXRSUkayW2oXiZW6vy0qz?=
 =?us-ascii?Q?vYNB/X7DsJ/E4VyFpz9VfLuUqPS/HLTcmkS9?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR12MB6109.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(921020)(38070700018)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hidBVmS8335xkOIft+AoeMlDM00sClUaUdIfAq1Lr8ItSrlqj+Z3zkCn++PR?=
 =?us-ascii?Q?ixHvyxD6o4er8FdoYHq8Xmv32gdMufCdwX5QR/uyLixm4UTytEmERha2Bhnz?=
 =?us-ascii?Q?mzj3fAT70NUCnQ349wadDRsXjtsrR7lDSfwdyGvTzX6wlR49htjeyOb5FFnS?=
 =?us-ascii?Q?caIMBni4VrtZC4b4jFAfPUjFn9CesrE6ZgYE3CYjENjaWPlYtgdYQ/kw3fR7?=
 =?us-ascii?Q?hAtTJNnFZzP2jRxmZmpuY6NEFHHG5a09HBCGj8cDNmmC3bEnAcQ/Jj2FvNsZ?=
 =?us-ascii?Q?k/0oL9BwQuEHbUIEZiyomGdGKpChS7Zj427md3ictPduGOqDkmCQAYt07ltF?=
 =?us-ascii?Q?ZI3ULhWJBJ08+rdlW4jjgPUPWZ0eEYP9DT62nwIt6cxME/Iyx6AbBotSNgWo?=
 =?us-ascii?Q?CPqVVBdLSAtUnv/C+KoGtQX5z+JWD5exp9dnduz0lrU/YRJRkH844heayIp+?=
 =?us-ascii?Q?hEsyRJeLSmRz7122TY0V37ti8jd7qZby/sYmAVR1zmw0zfK5nh5hbQufP+2u?=
 =?us-ascii?Q?bYFlLTXz7lA35krVSkrlUwHtgKd4sLzh9L13D0RKQTxODiMXpcf2VTCSVaEQ?=
 =?us-ascii?Q?jzqTqvhZ7Zfza7uFmJUnJA2xoRBrZX18cyLvNTDqGSpIc2PLo3gN/SN9fqnk?=
 =?us-ascii?Q?PDWdsdrQRbYIsOQ4O1hx5Rn8bhpWGvMoD1dh103o98L0QQLEGpguVL4KOoM6?=
 =?us-ascii?Q?mXRIWEhlSZk5JrZtMniBSiXaG0enO4EfL/RE0ORC8WX0vCjQL6FY6AfC0lhC?=
 =?us-ascii?Q?YmQwuU94kDPzNNdWFfBq/SvFhFIiCaEzdZfhBIHQqld+N/LJXArc40IzKk3V?=
 =?us-ascii?Q?qwfv4XQVA42rZNf743Z2XN7awtDWjKjSh5bJmE+4WEzz5xFz1QSM/0eACjEN?=
 =?us-ascii?Q?K7vp6cHrV0UPq+amleeyNmsjVtxDZO88Lf7isyMIsCfG8mhdeX3FqaBzmhir?=
 =?us-ascii?Q?QdepfDE8uEtYFS0YbmlnNOhLVrC7L37UPzb9WhmXTQL13XFeTXaGLDd4FQJY?=
 =?us-ascii?Q?dH4Im+vpdmKLk5AGyUDUCPGkV7FI45CTIcWdJS9+eE6MZYm1BIlCrP5J4mtM?=
 =?us-ascii?Q?wKTVjp5tYbQMS+UUXuPCQySux8b4m8fWWLr6cVNX6oGzrjpg5RXJWczZShpN?=
 =?us-ascii?Q?YgKfMu+nghl83OsuNv9YL4t7K5ElMGQZObmog9N207CGIydKALwu3YQgCbCR?=
 =?us-ascii?Q?xcrnDsKjmYLZYuqz7l/fjcRrkTqzDHqTRMkmFxEFYfHHxCRFRJu7NKFMnBoE?=
 =?us-ascii?Q?PxBHAc5SBsZKaQw5wcVgYsn/pEsqrodXPaXzWKoKbVCCaYIcSXOQb2J2stTI?=
 =?us-ascii?Q?FngfWk/UPRu8XLK1qHI8D444KqV+8gWaV0tFVs5ccEM7mjs1HjYjuST/p/8l?=
 =?us-ascii?Q?k2/uCLayRRDGAGbLXB2SPg8mqg43d0xBnTEXAA9YVAuDihkglIih93/H6rP6?=
 =?us-ascii?Q?pCn5jjfPmmk8SvaPvhVzk0+TIqIKwiRkREkc/Ze8UeNb4Zh8zpgTkqb0mctj?=
 =?us-ascii?Q?kwpOv1ftglQvWDUs9ktH6JwOhIKb75YY1/8BOJHPZYPevop4a00lYdIKenhx?=
 =?us-ascii?Q?w/kVbfyhWLc3CNk4RtY=3D?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6109.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75b36c27-7ed3-4a47-0195-08dde92befc8
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2025 07:48:27.1822
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Sjrcq07gEqrdFCfFJOEle9zLD2HMe9Ksv1Ek9oYbhbWY2V7mNLXlqjQDeHRF0tF9mhdpgwjWDvpMX5Gqxto66w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4375
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250901_004838_188381_FECFB25B 
X-CRM114-Status: GOOD (  21.02  )
X-Mailman-Approved-At: Sun, 14 Sep 2025 13:33:22 -0700
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

Ping!

> -----Original Message-----
> From: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> Sent: Wednesday, July 30, 2025 8:42 PM
> To: git (AMD-Xilinx) <git@amd.com>; alexandre.belloni@bootlin.com;
> Frank.Li@nxp.com; wsa+renesas@sang-engineering.com;
> quic_msavaliy@quicinc.com; S-k, Shyam-sundar <Shyam-sundar.S-k@amd.com>;
> xiaopei01@kylinos.cn; billy_tsai@aspeedtech.com; linux-i3c@lists.infradead.org;
> linux-kernel@vger.kernel.org
> Cc: Simek, Michal <michal.simek@amd.com>; Pandey, Radhey Shyam
> <radhey.shyam.pandey@amd.com>; Goud, Srinivas <srinivas.goud@amd.com>;
> Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>; manion05gk@gmail.com;
> Guntupalli, Manikanta <manikanta.guntupalli@amd.com>
> Subject: [PATCH V2] i3c: dw: Add shutdown support to dw_i3c_master driver
>
> Add shutdown handler to the Synopsys DesignWare I3C master driver, ensuring the
> device is gracefully disabled during system shutdown.
>
> The shutdown handler cancels any pending hot-join work and disables interrupts.
>
> Signed-off-by: Manikanta Guntupalli <manikanta.guntupalli@amd.com>
> ---
> Changes for V2:
> Removed pm_runtime_mark_last_busy() call from the shutdown handler, as it is
> being removed in the following commit.
> https://lore.kernel.org/linux-pm/20250704075225.3212486-1-
> sakari.ailus@linux.intel.com/
> ---
>  drivers/i3c/master/dw-i3c-master.c | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c b/drivers/i3c/master/dw-i3c-master.c
> index ae1992665673..2d16b7d74743 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -1762,6 +1762,28 @@ static const struct dev_pm_ops dw_i3c_pm_ops = {
>       SET_RUNTIME_PM_OPS(dw_i3c_master_runtime_suspend,
> dw_i3c_master_runtime_resume, NULL)  };
>
> +static void dw_i3c_shutdown(struct platform_device *pdev) {
> +     struct dw_i3c_master *master = platform_get_drvdata(pdev);
> +     int ret;
> +
> +     ret = pm_runtime_resume_and_get(master->dev);
> +     if (ret < 0) {
> +             dev_err(master->dev,
> +                     "<%s> cannot resume i3c bus master, err: %d\n",
> +                     __func__, ret);
> +             return;
> +     }
> +
> +     cancel_work_sync(&master->hj_work);
> +
> +     /* Disable interrupts */
> +     writel((u32)~INTR_ALL, master->regs + INTR_STATUS_EN);
> +     writel((u32)~INTR_ALL, master->regs + INTR_SIGNAL_EN);
> +
> +     pm_runtime_put_autosuspend(master->dev);
> +}
> +
>  static const struct of_device_id dw_i3c_master_of_match[] = {
>       { .compatible = "snps,dw-i3c-master-1.00a", },
>       {},
> @@ -1777,6 +1799,7 @@ MODULE_DEVICE_TABLE(acpi,
> amd_i3c_device_match);  static struct platform_driver dw_i3c_driver = {
>       .probe = dw_i3c_probe,
>       .remove = dw_i3c_remove,
> +     .shutdown = dw_i3c_shutdown,
>       .driver = {
>               .name = "dw-i3c-master",
>               .of_match_table = dw_i3c_master_of_match,
> --
> 2.34.1

Thanks,
Manikanta.

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
