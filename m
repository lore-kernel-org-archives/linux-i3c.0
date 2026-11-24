Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F140606A321
	for <linux-i3c@archiver.kernel.org>; Tue, 24 Nov 2026 03:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AeDgnwmt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=pfptdkimsnps header.b=mcX3Fv6N;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=mail header.b=ceeYKh7w;
	dkim=neutral header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aeHUla93
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=/bNUR9Un5ttQgSnsJo6ufpa4gjicWhvqJ6KqFZRQ+sE=; b=AeDgnwmt4eZhzSu1w8QlMwXuFr
	nNBKpHPWd7WMJPbiRy9VZ0Rl9ENFSgFi0a6OGCrnUyPfIvMV13eC711qEjh2Vz3anOnNT/XI2y0iy
	mt1Qf4kEQ4pbXWafdburwRlDf2bTF/MpGSNEUzDZEJdORvlWRHiCoXJU8RX5Jy7CBdv4PHz+uQ+ck
	TJ3QteJgoPFf4octKc45stc+jxmuXXdfr55YfARz5YI6ujNt+LVjps+12hnLN2XkHgVeIBxI3IIam
	p1MhILn2MU0BqQzDbU6kfWv15Ztzy2ww4bfTAbwjcTUZFwOJo8LIcL2zqFVzr5MITKz3HbX4OfE8x
	f/A7qWMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVglQ-00000005Pfy-0VME;
	Tue, 24 Nov 2026 03:00:12 +0000
Received: from mx0b-00230701.pphosted.com ([148.163.158.9])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVglL-00000005PfX-03Zk
	for linux-i3c@lists.infradead.org;
	Tue, 24 Nov 2026 03:00:10 +0000
Received: from pps.filterd (m0098572.ppops.net [127.0.0.1])
	by mx0b-00230701.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2lXC62254664;
	Mon, 23 Nov 2026 18:59:57 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pfptdkimsnps;
	 bh=axP8DStLGmaKxU/TFJmH03ZtceEJGbOM1LG3xP10WbI=; b=mcX3Fv6NLZTA
	iYiBCUmyR2NTJKwWzOmA9Mo0TYuF4mD1Zdr7OTmNN82tu6YjDSrRdquyeIDJZaTC
	Zpe8slLfjt9Bx66Qllry4LW0FRELU1/yN00DZ5VX859CYP7D/qEabWjywNaaLSYo
	0MkDTVNPtt0X8Ja48mpcBMacqsDgxtpdCdFhS5j/mI4WJiJJyNlxCo1yc2sB2NCO
	wNzVW0koJDWL73nqMt3NfJAt0oxytb6yFNeT1X1c1WX0BLNyhgVrNbLQPzBCkGzX
	vfeJwa9Yqa2DAUIiXlbfoaJdigWksvxun/55skjbxlOGdZ+BxuYGiSrUy9Niwz+9
	lggV8KnUiA==
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.87.133])
	by mx0b-00230701.pphosted.com (PPS) with ESMTPS id 4j4suvu9f0-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 23 Nov 2026 18:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1795489196; bh=D+zNTNrpv40kpr1Xo6b95V50AKswsQPq4K9XWQfHS/M=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=ceeYKh7w5twZ2rGmYER9/MwGjRRljWDQatNl8qUKmLmZjwOUkBcABvcQ8a08GwI5P
	 EYPrOhRhwCCqt8O2XwyWaOkVko21tWcjKdprpi+Tt9g9sX6X22t74cY5JNiMN2gNDG
	 Ao05+lzwO/iUVUda+TF8k6iqTL6RrLHqNj26XVfOBSG7uyWtZ44hK+rJU22MRmKEyz
	 3I+mZRlAGnhH3TqL/9XdkQ6inNMzOUTZu/hL441hqVp0v0SWL2j5KtDr4qu4XjWwMY
	 Zxi0E06eoZiK6wdHhmn3zK7ljqfxWChuU2eZ29PiFlEDalHHrehFd544MwwjZr7rFz
	 Myrzf1P/ecA3Q==
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com [10.192.0.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id A222D40238;
	Tue, 24 Nov 2026 02:59:55 +0000 (UTC)
Received: from o365relay-in.synopsys.com (us03-o365relay1.synopsys.com [10.4.161.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits)
	 client-signature RSA-PSS (2048 bits))
	(Client CN "o365relay-in.synopsys.com", Issuer "Sectigo Public Server Authentication CA OV R36" (not verified))
	by mailhost.synopsys.com (Postfix) with ESMTPS id 28FF8A00B0;
	Tue, 24 Nov 2026 02:59:55 +0000 (UTC)
Authentication-Results: o365relay-in.synopsys.com; dmarc=pass (p=reject dis=none) header.from=synopsys.com
Authentication-Results: o365relay-in.synopsys.com; spf=pass smtp.mailfrom=synopsys.com
Authentication-Results: o365relay-in.synopsys.com;
	dkim=pass (1024-bit key; unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256 header.s=selector1 header.b=aeHUla93;
	dkim-atps=neutral
Received: from DM2PR0701CU001.outbound.protection.outlook.com (mail-dm2pr0701cu00103.outbound.protection.outlook.com [40.93.13.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.protection.outlook.com", Issuer "DigiCert SHA2 Secure Server CA" (not verified))
	by o365relay-in.synopsys.com (Postfix) with ESMTPS id E09AA40131;
	Tue, 24 Nov 2026 02:59:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=weeQxY6MYbEu9eX7IJ58n0HpwpU0VrIs9stDnMj4INAsoCXs9ow/Ry/KMdMomc4tfmpJrkZW4G94bogl02IJ/Mbxl5q5wHg4nS2QY9m8sTPC75levTilto1dMjPZlgvq+IREGSrVedajb3RyoRM9taRfK4tpvx3AvsiW7D9/HJEBmFPAbHZrqgUVs1v2j59IsWVTL6G5dURo0KWXui2zu3ea3+ifkuFUPZKeQy7+xlwXm5rVCGgC1W/n3JBtWFChXSicGfUi9W0lMLfUhnQMATUlliivJ8jQiQ0uB/azf13gu3p+eABWewejNAovQiJww+El/WwMpSH1DLccTuhyEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=axP8DStLGmaKxU/TFJmH03ZtceEJGbOM1LG3xP10WbI=;
 b=j6TABBH3mhs/Ouil3yKDvMMyrwcomMHH21+Pxp86qBt7iAoVO7wjolOuqvNQi5tAypYZEPxy7As6xK7BseJVx2E4e8Je6XpJvd8OuClHSeOqOj2nQ7Br8pWFcK+lYWXiFd2g0nal/md3fPlbjuH3kplyqau6LjvqhGOS5qsBiO0pxZlS9wguEa03OMGdeIV+fcP9qz7ucUMVdLhIOyiVn5ci3CCM4+Y9OHo2758uTMmDsW7hyVlT5RHuIfcL5OeEXvIV1dbc326vPAD7a+SRhtlJrFuASueXeXx5xwhc5CsBWhncpXlXckOPIL0vGJyJPkxQtYB3MDsajAPLGF3KNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=axP8DStLGmaKxU/TFJmH03ZtceEJGbOM1LG3xP10WbI=;
 b=aeHUla933t7pOiSp1xPD5Vkokro0I5I9etvS5M3Tc3k029RtZiXk04atwbfdgwJGWSGYtT9bdjoJqJS1vC/uvG0kcQudKg61VyPZS0PZOQf8FI+iKnjH2lOREUSJkaPI0hG0AtNmSwo0xikfbesn/5HelDQ+etSRMey5k5kNhBQ=
Received: from DM6PR12MB4074.namprd12.prod.outlook.com (2603:10b6:5:218::11)
 by MN2PR12MB4392.namprd12.prod.outlook.com (2603:10b6:208:264::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Tue, 24 Nov
 2026 02:59:50 +0000
Received: from DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::78e1:d71c:6c9e:382c]) by DM6PR12MB4074.namprd12.prod.outlook.com
 ([fe80::78e1:d71c:6c9e:382c%3]) with mapi id 15.21.0615.013; Tue, 24 Nov 2026
 02:59:50 +0000
X-SNPS-Relay: synopsys.com
From: Dineshkumar Parameswaran <Dineshkumar.Parameswaran@synopsys.com>
To: Frank Li <Frank.li@oss.nxp.com>
CC: "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "alexandre.belloni@bootlin.com"
	<alexandre.belloni@bootlin.com>,
        "linux-i3c@lists.infradead.org"
	<linux-i3c@lists.infradead.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
Thread-Topic: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to
 Designware Controller.
Thread-Index: AQHdeC3mxdpAnuJwGUWQKP5HWXbY8bc8IM+AgABuDLA=
Date: Tue, 24 Nov 2026 02:59:50 +0000
Message-ID: <DM6PR12MB4074F28613C2DBF99889D2DDBD442@DM6PR12MB4074.namprd12.prod.outlook.com>
References: <20261111021151.58380-1-parame@synopsys.com>
 <20261119135703.22729-1-parame@synopsys.com>
 <awSg5WQFw6NktkEi@lizhi-Precision-Tower-5810>
In-Reply-To: <awSg5WQFw6NktkEi@lizhi-Precision-Tower-5810>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR12MB4074:EE_|MN2PR12MB4392:EE_
x-ms-office365-filtering-correlation-id: 5266fa56-8c8a-4d39-9465-08df49d70183
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|261009223327099003|38070700021|10067099003|4143699003|261021123027099003|261102123227099003|261026121527099003|56012099006|11063799006|261026140227099003|261021121427099003|261028144727099003|261022105027099003|261009223027099003|261009221727099003|18002099003|22082099003|261009221227099003|3023799007|261009220027099003;
x-microsoft-antispam-message-info: mj75bGbg8m98Hh747dRsDsqDkF237CZ/5iwwY4xeVI5vV3BjTpWc0iJkuWjq0pqg5WnHrP2i0ZOKet6pM8GTNWodJSIDlcvJeE4CmUNaq9oh5LmvySoiCY1FyjWcoBISMVLQZb9OnCL33eY3RplqlJxFjow18NRKoqvV+iZ+L7fPO6hG5mwEoRz2RaSmV78XcRRNKRIgOX7e4Gd0bpp+l7hFQZRyiHhvIdTO8Bmphe063WGb5BxIWh5VdABk+gqf08xphsrb7P5hJH0KwZ8+hZgq/cvKblSyXWY4QbPUsjU4JkiNOosee2RgdKHK2uXh1CrCruQvDEIIL4Kk5L+NBPwv8MWZYYKLz8m5BTzrGUUtJ9OTT09DMkSFeNVshiNQ2x1J9HSw+rU2NPgqtMbYdKWO4XvpK1xLUZV+n48Nnk1wb4Sf+flP9D5qevv1cPEgNqm46TGhcPLCFwUd2jm2nosFa9RtbLunLWOH1NmyHSs6uJjXAW4+7Nk0nnUFZ6yCgjPz+7LImIrjFgpFVb9Xm0ivmvm4G+InjFrYtRAa7mqJQVRWQxG/eD4N6PJPqlcjP0b/KkWT5LdK+jb6FZ6H0rhMVXs7108jV2ADHWy3wfuFblBlC38DJ6O3savEz52xZjgrOpL2VkNG9YaS/EKADPxmu3qJdTH5Js9nCIed1ukYkd4LiZl6QP3Q361uzPCQ+jZc6xDJEpb0oQHvRuOQ7l+eGifT5e1zxaOUvIaAXm4=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB4074.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(261009223327099003)(38070700021)(10067099003)(4143699003)(261021123027099003)(261102123227099003)(261026121527099003)(56012099006)(11063799006)(261026140227099003)(261021121427099003)(261028144727099003)(261022105027099003)(261009223027099003)(261009221727099003)(18002099003)(22082099003)(261009221227099003)(3023799007)(261009220027099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iILokUkpbc7T4AG5E9XLvYg1d5N5mPeldXWU7EKjEgY29ejI6SZ+ZfJvwlrv?=
 =?us-ascii?Q?nCgjX1/8tro2eQe0usnukCYE7sTMRm/xxnk9V9frzYm5YIJhesHTMeU4kxsR?=
 =?us-ascii?Q?lnLi8pUDhdNUY9G24TtyXzaLifVkbP0s1jtWJA3vFHSIgM6MST5f3vNG/Boj?=
 =?us-ascii?Q?y0zCxMDjYgy72z7c/l/XY1bEPD4Q8Y/rr28uxpz/MGH1XLizn6paqt4fJe0L?=
 =?us-ascii?Q?BVuuVj5Wf92vhBZabdTLIVNTmu3L1/0k7SsQLlaYFaEozxrrOEhA+cQi1feS?=
 =?us-ascii?Q?ZXu9jfZtn8g95uFJdZyQt7vIJosom3prAIEuvIziWDBfGKuPwYVGe+QADMS9?=
 =?us-ascii?Q?K6XHRcDA5kuqLLca96VDFjE+RvA5u6Dr6FLfIR5Z5pI0e+Z4DH1bP/AhFIDT?=
 =?us-ascii?Q?pbHV8hh8mDIdADUwIwwkv5zwQLGmKBp1uXboiXv94f1IIgi1ENrD+pmUvZKw?=
 =?us-ascii?Q?+YVi5xnuZa0aQ/xvrqc8lCqmPHNun+E+PlgkFkOcdW/PtLSOXe078XN3z2Xh?=
 =?us-ascii?Q?dBlTHmq+5zKca9Rv7mMCeuNf7HAFy98FPYICI7A0mXsHDhoG4giDU+2/jYJK?=
 =?us-ascii?Q?KZVu375OEv5VdGbNwXWnQbd+8ids9/Ug0s67uuDMANUpQOI3u7o+uFw49ujp?=
 =?us-ascii?Q?tn+6R2XfRO/6mx3ArpmkzUkNieLxlbNNz8X6vn9KzgDZK0utq2IDbtukj8Pa?=
 =?us-ascii?Q?4jpukDBtPQwguWEL9dNXpiLNz5tnTEYEU4cOro7P4GLVwR+sti4QsXOiDK3u?=
 =?us-ascii?Q?pL+q/g8igaJ1cA7B/0HcXKYEwgIJ7YLojkV8zLFUghSM1P/PPJV4Z7RqW6uy?=
 =?us-ascii?Q?HzHT+x5jQxZ2dz820e0GQHAJFtmiX8pijFYX+RMbCzwC8EbrVHQqbD6aZ53c?=
 =?us-ascii?Q?UdOwIs9wWiYNcd4DN0ThygnS0XnitKayFB8CzLiBxGOSd/TtV2mc2Uvb5sCv?=
 =?us-ascii?Q?pgCYfflvRvMjs1ftDI/bqUmSd1bPX+I9Lx3+pR0aFBJaN8VYnVwychOez9JR?=
 =?us-ascii?Q?ap8wFKeE+gJJAB2zt4BjfqVay2TThmoLLqtaHpB3fVhxn4ic3Ymobp+IEIRc?=
 =?us-ascii?Q?Ojc3CrsekritFJN3DgG2aZjSgGBHJJ5ML4+HD41855HVhERzPexvs75C0La+?=
 =?us-ascii?Q?XWf3SPU0VGf/1ckSqnCT/vdMeMGlha+0YkFkEtbmXePT4d/geXzSDzK8cWSj?=
 =?us-ascii?Q?lHwLz14icLMgo0rXyNPhKPfJlM/9W73d3UQC2F7RmvSW4t7azpDv8JMSYIkX?=
 =?us-ascii?Q?BNXhL59w5UWV1ddH29v1Z5nezxzIo48sjAsIE+wjCjBejpE1Jcx/lVZ6SJy5?=
 =?us-ascii?Q?eUJNGJUIS4dTmjwPE9jCjeKPoF08QF6ThVFE0qDVm0vjA+wC/ojfKDOU/9SU?=
 =?us-ascii?Q?p8LU120pd9Y01PrIsxqSx/GHltH65QCnUoLg8DdDLgYnZnMckk6BclVbehqY?=
 =?us-ascii?Q?9f/T6MXa2ghCAsim34H2Lr4b1m/4g9Zg0zh9lXrMmjmdQqIioNViiffFHRUT?=
 =?us-ascii?Q?1vMXmi3F6MWa9eFBkLt/ZCFGnlbEZnbc9mWxHFLNDFRilKdrq07rFtNhe58k?=
 =?us-ascii?Q?95T2E5RWi7YeEibi4SKbT3EYhOMqpJqGkh3kiTU6lRiZoXOd0Cz9yi1DwPgO?=
 =?us-ascii?Q?AxEYHw2Z2lC6orFcQ7EDyfSRkzQGrQg++wX+nQ9Bcz2EhvThl4KVi/oIN3ET?=
 =?us-ascii?Q?SRGbyazfEDFItAHUyMKrXIkHFsQUJ0/VPU9kcYUiJpOSoR1b?=
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: jxDxPBtbyRDGIKI3SjwMbGBSSGld7jCiUTyuu8Au20XDCtsJPXZa3Knort4bIjIeSNGZX1P7reJoEAFgJOQKFTcdss4obgbE7sXh0AAv3f/ciGCPg26eT8JtAUXBz58W8oLpIzX2j4tmYS8CxQu9NRMLeRL88lSgKGgdjn/8u7MBnck7pfyR/nji0kEGtzT5iTcbxzRTG++sRydlx+phbFEFJLXwaRDoL/DLQ1FLKqaTBx5SBy0B7bQkwjLRjxF94eflIL3efit8FYSix7IPlcy594qYO7+pkBh6ktiUpK55HHovsLXzx+Y15VrypR15HebxFmFcZR2wBB1qlBezdg==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Qwg2+Mqg70gLK4Wcl/wqEtG3lfZLVabrydyM7H0My8OV9L83hxmoTx1JcvlKhtiQxVL1W7eyFX9jK60l+CGOZ+ypf58xtcxPueMvpaNvPGke5a2/DtznHF0BQ7H5q8hGXo4nJb/4Hj+shELYhkc89Gc1XsEL2uoujolDJonYZaQIh6zupvWMMnLXNBvAvxUj2HkRAZBsLc44GLQjru2k6I1f1cl/RC7uT7MZfvl3rPJAKtxpKfEl7k8PkGcRIusojMiircKM7RUPy8jyKwD/r0Hp1JC31zytAUoIra6womhlXvOHVXpWoG+rWK5whVIwhtLyBCG4WwlrKJzxcMmYjYcjwMoxRqdFJ7dgEEsgVLcwSraTXSIhsjBkVCD7UuknEvEn7H+5zhBpBQSSV267sTJTrEPajJ3VTMViWGKo2CIOvOUX5aVo6xwJ17Ssm7vXxVW14JHY7qYWfib9Re3zIpMrWaRRug4GTOxwrfiSzsuUgo8LV7oQDEBckJi6irM2Cwfn6jtd2fJgtJBfHxvB0jNM0yiYd4vXLBH7HtpMJ6OBKli8OfRLK+mk+37f03VZjI7zFry45zpQiCKMEqtfSWEOBymc0ULWtl5bjehOMmAJO+LdFULw86t0PdVhVynsBwnV4/VuPb3vTnodOqrT/Q==
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB4074.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5266fa56-8c8a-4d39-9465-08df49d70183
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2026 02:59:50.1968
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ssncEpRyPtm+3ulY/EPYxCpOr94kjzjRDsZS9usoKcVVn85om7RRcY9kBRbqL5WA51XrUNW4BKST3+cq3zfYWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4392
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX2xNyu2LHnESZ
 UyClTFWWu6F3YXpVwNNQSV6LzEKm+AgHDW75KgRx+i3FW99kFUGoTwQ2Qs9M/sLKrGWVa1VH/KL
 YxYA2dhxbdm/Kgii+pMrvbrmK//xHaM=
X-Authority-Analysis: v=2.4 cv=VPxIDNPX c=1 sm=1 tr=0 ts=6b04fdad cx=c_pps
 a=t4gDRyhI9k+KZ5gXRQysFQ==:117 a=t4gDRyhI9k+KZ5gXRQysFQ==:17
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=qPHU084jO2kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=tU_645BZ7FZt8VqRJtHG:22 a=jSPayVjLy6xbsuKauFBc:22
 a=8AirrxEcAAAA:8 a=jIQo8A4GAAAA:8 a=P-IC7800AAAA:8 a=JfrnYn6hAAAA:8
 a=VwQbUJbxAAAA:8 a=VTqiYXDrsOJPCz6ShBkA:9 a=CjuIK1q_8ugA:10
 a=ST-jHhOKWsTCqRlWije3:22 a=d3PnA9EDa4IxuAV0gXij:22 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-ORIG-GUID: 1I-BuZj7M3sOKVPqHJCc6zZDcBhsH7CJ
X-Proofpoint-GUID: 1I-BuZj7M3sOKVPqHJCc6zZDcBhsH7CJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMSBTYWx0ZWRfX4SgwIiRfR9kx
 e+pKKhsB5IvDvJOfjwIhadN3SIsksT6nBLCJk+tfjkuudTMHbVhxc6Dmg6Vr09LJvJM/IiT+CzN
 bvHkflmtujyKxCvbX4hpFtleugT1SpUwdRnLmvExukkKgfHQZrsq3w0P35MdjBCzbrOxUTUtJM0
 QNn/jOdxEuQ64Rnx4nIwRwR0SMIyNiDWpW9LZPwo1iO5MeBMETD8VDuVj04HzHxTPQN49SQceuU
 ATuQbDVWcU6hgvue57YJgqTOmGYcBhqZq38PVb6ZXxcpyEQ9ZNff2fzL0gBWnsnhVeJdvIFWJ5o
 m+C1ziDFaKNJ0yh4rF5HbOXMzsqnrS9/8vyVltqb/fpC04iLO/Y7AgqBx+AwfwdT6PYiCmjFAJR
 ZVZqOnrCPJdbJN+4fAJEeuesgdHEp5mXimEr6IPOVjmMPmm7htqUJUZ0DiDjbJPBFRXLv0F/0Se
 gLAV8HN/dJYfjdRjolg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam
 policy=outbound_active_cloned score=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1011 spamscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2611040001 definitions=main-2611240011
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261123_190007_213884_BE9EDC1A 
X-CRM114-Status: GOOD (  10.41  )
X-Spam-Score: -2.8 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Frank Li,

This is not the new patch or feature. For the same feature addressing the comments. That's why created in the same thread. Are you willing to create new thread for this patch and ignore the old thread.

Regards,
Dineshkumar. 

-----Original Message-----
From: Frank Li <Frank.li@oss.nxp.com> 
Sent: 24 November 2026 01:54
To: Dineshkumar Parameswaran <parame@synopsys.com>
Cc: Frank.Li@nxp.com; alexandre.belloni@bootlin.com; linux-i3c@lists.infradead.org; linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] i3c: master: dw-i3c-master: Add HDR-DDR support to Designware Controller.

On Thu, Nov 19, 2026 at 07:27:03PM +0530, Dineshkumar Parameswaran wrote:
> Implement HDR-DDR transfer support for the DesignWare Controller.
> Only support for private transfers and does not support sending CCC 
> commands in HDR mode.
>
> Key differences:
> - Sets the speed to HDR_DDR_SPEED(6) and COMMAND_PORT_CP to do data 
> transfer in HDR-DDR mode. Hardware will generate the ENTHDR0 based on 
> this.
> - HDR exit pattern will generated from the hardware when it sees the 
> TOC on HDR-DDR mode.
>
> Signed-off-by: Dineshkumar Parameswaran <parame@synopsys.com>
> ---

I already said, don't post new patch at old thread.

> changes in v4:
> - Fixed using HDR-DDR cmd direction instead of using rnw directly.
>
>  drivers/i3c/master/dw-i3c-master.c | 41 
> ++++++++++++++++++++++++------
>  1 file changed, 33 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/i3c/master/dw-i3c-master.c 
> b/drivers/i3c/master/dw-i3c-master.c
> index 05584ddaf104..d94e7a6d28f9 100644
> --- a/drivers/i3c/master/dw-i3c-master.c
> +++ b/drivers/i3c/master/dw-i3c-master.c
> @@ -65,6 +65,8 @@
>  #define COMMAND_PORT_DEV_COUNT(x)	(((x) << 21) & GENMASK(25, 21))
>  #define COMMAND_PORT_ADDR_ASSGN_CMD	0x03
>
> +#define HDR_DDR_CMD_READ		0x80
> +
>  #define RESPONSE_QUEUE_PORT		0x10
>  #define RESPONSE_PORT_ERR_STATUS(x)	(((x) & GENMASK(31, 28)) >> 28)
>  #define RESPONSE_NO_ERROR		0
> @@ -232,6 +234,8 @@
>  #define I3C_BUS_I2C_FMP_TLOW_MIN_NS	500
>  #define I3C_BUS_THIGH_MAX_NS		41
>
> +#define DW_I3C_HDR_DDR_SPEED	6
> +
>  #define XFER_TIMEOUT (msecs_to_jiffies(1000))  #define 
> RPM_AUTOSUSPEND_TIMEOUT 1000 /* ms */
>
> @@ -381,6 +385,11 @@ static void dw_i3c_master_read_ibi_fifo(struct dw_i3c_master *master,
>  	i3c_readl_fifo(master->regs + IBI_QUEUE_STATUS, bytes, nbytes);  }
>
> +static bool dw_cmd_is_read(u32 rnw_cmd, enum i3c_xfer_mode mode) {
> +	return (mode == I3C_HDR_DDR) ? (rnw_cmd & HDR_DDR_CMD_READ) : 
> +rnw_cmd; }
> +
>  static struct dw_i3c_xfer *
>  dw_i3c_master_alloc_xfer(struct dw_i3c_master *master, unsigned int 
> ncmds)  { @@ -726,6 +735,8 @@ static int dw_i3c_master_bus_init(struct 
> i3c_master_controller *m)
>  	memset(&info, 0, sizeof(info));
>  	info.dyn_addr = ret;
>
> +	info.hdr_cap = I3C_CCC_HDR_MODE(I3C_HDR_DDR);
> +
>  	ret = i3c_master_set_info(&master->base, &info);
>  	if (ret)
>  		goto rpm_out;
> @@ -962,7 +973,8 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	struct dw_i3c_i2c_dev_data *data = i3c_dev_get_master_data(dev);
>  	struct i3c_master_controller *m = i3c_dev_get_master(dev);
>  	struct dw_i3c_master *master = to_dw_i3c_master(m);
> -	unsigned int nrxwords = 0, ntxwords = 0;
> +	unsigned int nrxwords = 0, ntxwords = 0, rnw_cmd;
> +	bool rnw;
>  	int i, ret = 0;
>
>  	if (!i3c_nxfers)
> @@ -972,7 +984,10 @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  		return -EOPNOTSUPP;
>
>  	for (i = 0; i < i3c_nxfers; i++) {
> -		if (i3c_xfers[i].rnw)
> +		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
> +		rnw = dw_cmd_is_read(rnw_cmd, mode);
> +
> +		if (rnw)
>  			nrxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4);
>  		else
>  			ntxwords += DIV_ROUND_UP(i3c_xfers[i].len, 4); @@ -995,28 +1010,36 
> @@ static int dw_i3c_master_i3c_xfers(struct i3c_dev_desc *dev,
>  	}
>
>  	for (i = 0; i < i3c_nxfers; i++) {
> +		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
> +		rnw = dw_cmd_is_read(rnw_cmd, mode);

Can you pass down &(i3c_xfers[i]) instand rnw_cmd? so in dw_cmd_is_read() there already have I3C_SDR check logic.

And actually rnw and cmd is union, which point to the same value.

Frank

>  		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
>
>  		cmd->cmd_hi = COMMAND_PORT_ARG_DATA_LEN(i3c_xfers[i].len) |
>  			COMMAND_PORT_TRANSFER_ARG;
>
> -		if (i3c_xfers[i].rnw) {
> +		if (rnw) {
>  			cmd->rx_buf = i3c_xfers[i].data.in;
>  			cmd->rx_len = i3c_xfers[i].len;
> -			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER |
> -				      COMMAND_PORT_SPEED(dev->info.max_read_ds);
> +			cmd->cmd_lo = COMMAND_PORT_READ_TRANSFER;
>
>  		} else {
>  			cmd->tx_buf = i3c_xfers[i].data.out;
>  			cmd->tx_len = i3c_xfers[i].len;
> -			cmd->cmd_lo =
> -				COMMAND_PORT_SPEED(dev->info.max_write_ds);
>  		}
>
>  		cmd->cmd_lo |= COMMAND_PORT_TID(i) |
>  			       COMMAND_PORT_DEV_INDEX(data->index) |
>  			       COMMAND_PORT_ROC;
>
> +		if (mode == I3C_HDR_DDR) {
> +			cmd->cmd_lo |= COMMAND_PORT_CMD(rnw_cmd) | COMMAND_PORT_CP |
> +				COMMAND_PORT_SPEED(DW_I3C_HDR_DDR_SPEED);
> +		} else {
> +			cmd->cmd_lo |= (i3c_xfers[i].rnw) ?
> +				COMMAND_PORT_SPEED(dev->info.max_read_ds) :
> +				COMMAND_PORT_SPEED(dev->info.max_write_ds);
> +		}
> +
>  		if (i == (i3c_nxfers - 1))
>  			cmd->cmd_lo |= COMMAND_PORT_TOC;
>  	}
> @@ -1027,8 +1050,10 @@ static int dw_i3c_master_i3c_xfers(struct 
> i3c_dev_desc *dev,
>
>  	for (i = 0; i < i3c_nxfers; i++) {
>  		struct dw_i3c_cmd *cmd = &xfer->cmds[i];
> +		rnw_cmd = (mode == I3C_SDR) ? i3c_xfers[i].rnw : i3c_xfers[i].cmd;
> +		rnw = dw_cmd_is_read(rnw_cmd, mode);
>
> -		if (i3c_xfers[i].rnw)
> +		if (rnw)
>  			i3c_xfers[i].len = cmd->rx_len;
>  	}
>
> --
> 2.34.1
>

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
