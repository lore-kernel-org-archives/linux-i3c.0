Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 014ACC432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 14:27:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C89CE20862
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 14:27:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="D8yCBGt0";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="REgWBEc7";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="JcJFDdLH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C89CE20862
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q85c07Qis0wxsczLpTPH5uauuYsih0WUdbbDyAVzjk4=; b=D8yCBGt0P5v+iX
	NTdotodAzvjYWFYXabbpflDwootcOdwUqdlMQWl5raCL9OlOWz5wKJ+AUvfVFgRnNZnGx6DCiW/7c
	+aZQN3j8tdQ0rpJ4k6p/q+eXHD/NMA5XNh4+Hka8xKaOFJJWjr/fa7N0NEXWUe2R8BZ7Rg2/5UAe6
	MidG0xyN8vwTwUcwLQJ7Pp65V8dGAs5CjcBnneeWolEZyA1W29r0RlTU/o40wvy8Qro5xSZ+wb+9C
	3OB6tzBVeN9H22yZx9Sm9S4I+P44jlbmNaiodNM1peo8wc1Gjd0uhEm+UlP6oiV4pCL8Hofvr1s2O
	sKvcYwb1GBM5NrHMRJIw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZFKm-0008HP-HS; Mon, 25 Nov 2019 14:27:24 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZFKj-0008Gt-Mw
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 14:27:23 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 10508C271E;
 Mon, 25 Nov 2019 14:27:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574692041; bh=yQwEifWqAtVSMXiba9XtxLi0s+vGqK4SZYGw/6Xk3NE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=REgWBEc7HyvUst4v8DTAj7UQloQslU/U1xmu7FC03PgQdFV1RTHF6BtTpM8SSUwuh
 Sq+SwxJU3mFPZFeVWCymu7RWJxhMK0VoZZeS4spGV5JF6EShjrK8PvZPpqNTzELVWi
 7+yVnJa3m07qywhIEUXynfrBWULn4kU2dwQSqWaIq9+AWj7Igj0YsTr94cs8sjhJLz
 nRf15ZdFYDFu7dv1gevyc/vKmSbBAwnXBYUKsi8dgkL9+U9RTbBh/ZihQQ/j0o8HcN
 La1c3yFgLrUQi6Sdji301rNVRMCR3IIUTEfBFLowIsm4Armm0RQdr/L1km19ZZfMR4
 xqTposfGoJsPQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 78A6AA0083;
 Mon, 25 Nov 2019 14:27:20 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 06:27:20 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 06:27:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3Adogl/TyNPV0XBCe8dtuTyGR6TWWarkTuXCuRoacmGjCuyn1W2auEbMFaLvK7yunOouSPvYnOdTmIu5ykiqh1A67/Yf+i24qqnNq2fIt5A92hIkfbCGv8c3MlodLnHEM6s3qpV0jD+KXzsUXSB3Ex//TLEPRVic1XdpsiwlCPeUVyIJw00We7oeF6EQo3zt+yiM2nA21ceG6RgXC9u0Caagb5+ZM3jK1vEW/d22TLRmA+P28YqY6fPVsY+PvMuXChOt60/3c8V5IvNNABvn29vXppVWzTBBxaxRFCl/Q+thDwQFGU3U7yTsxCt8WYHnyfKaPQqcEBCrraEWE6VpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52HdIMWioYnr0o0Yl1aADUKv/P5FdBidS22KFYILBoo=;
 b=JyiAIjwl/MFEDFvCv+Bcf9FHOVrzbRegjl52TvhKQ2jYf/VtKTRTHh6ZPS77eoP2xPDREFmFXVP8rkliQK+a+yGhbwUejC7y0Ljtgk8hC4IEfn6axWlSrmVyZb6y2lzFhnDeeuNHNl+XQKloGMxTSr897ZNf58hvKr3dyLxQTk8YOjMkTnLbaYInA/qa8b05SOJ6Nx485DyUqez/6M1uIWA96YsCyvBDKdL7YTH5WG3u0eCb2KtNFvvxpUGZuKk9uM+KKqPg83v4sAKcRfiGGEcu0XXs30zOCEgIs+tT4J9bWKspR8mwB8UxVbKMk7mYQ0cogmVT/qoIs+EabRlNmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=52HdIMWioYnr0o0Yl1aADUKv/P5FdBidS22KFYILBoo=;
 b=JcJFDdLHCTpZCl4fuzJdwYocL/yzGxHfEXAPo7xQX/o02YzXYmpFCr5AnycTbM7OvhnyrZed55SpJjVXzMIA5uwxUfGJWijLN8pEv/j1EwqJhSb8Kidk3in6uLGsg+I+ja8pXEhj052WAPEyiAFqEyUf8P37Nxkd0n+iTh+Z99I=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4150.namprd12.prod.outlook.com (20.180.6.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Mon, 25 Nov 2019 14:27:18 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 14:27:18 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wIAABiYAgAAAhVCAAAUuAIAAARUggAAGeoCAAAYHIIAABy8AgAABCAA=
Date: Mon, 25 Nov 2019 14:27:18 +0000
Message-ID: <CH2PR12MB4216F1775A4F133EF845EC01AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
 <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125115502.GA5777@global.cadence.com>
 <CH2PR12MB421667CED7F6A5FF0299E732AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125132219.2e45d084@collabora.com>
 <CH2PR12MB421644B0CAB1DEF50675995EAE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125140936.47f3d479@collabora.com>
In-Reply-To: <20191125140936.47f3d479@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctYWNkMzJhMTAtMGY4Zi0xMWVhLTgyNjgtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XGFjZDMyYTExLTBmOGYtMTFlYS04MjY4LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMjg1NSIgdD0iMTMyMTkxNjU2MzYzMzYw?=
 =?us-ascii?Q?NzEyIiBoPSIwcUk3MXRFM29jUDdMdFdqTkVUdEloL0JleDg9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQURJ?=
 =?us-ascii?Q?QWM5dm5LUFZBYkxvdC9oRlBsQ2tzdWkzK0VVK1VLUU9BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFDa0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQWt4V29sUUFBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
 =?us-ascii?Q?aEFHNEFZd0JsQUY4QWNBQnNBR0VBYmdCdUFHa0FiZ0JuQUY4QWR3QmhBSFFB?=
 =?us-ascii?Q?WlFCeUFHMEFZUUJ5QUdzQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FYd0J3?=
 =?us-ascii?Q?QUdFQWNnQjBBRzRBWlFCeUFITUFYd0JuQUdZQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNBQUFB?=
 =?us-ascii?Q?QUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJnQmxB?=
 =?us-ascii?Q?SElBY3dCZkFITUFZUUJ0QUhNQWRRQnVBR2NBWHdCakFHOEFiZ0JtQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFHOEFk?=
 =?us-ascii?Q?UUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBY3dCaEFH?=
 =?us-ascii?Q?MEFjd0IxQUc0QVp3QmZBSElBWlFCekFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3?=
 =?us-ascii?Q?QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QnpBRzBBYVFCakFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdC?=
 =?us-ascii?Q?bEFISUFjd0JmQUhNQWRBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4?=
 =?us-ascii?Q?QWRRQnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFkQUJ6?=
 =?us-ascii?Q?QUcwQVl3QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtB?=
 =?us-ascii?Q?WHdCd0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCMUFHMEFZd0FBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFD?=
 =?us-ascii?Q?QUFBQUFBQ2VBQUFBWndCMEFITUFYd0J3QUhJQWJ3QmtBSFVBWXdCMEFGOEFk?=
 =?us-ascii?Q?QUJ5QUdFQWFRQnVBR2tBYmdCbkFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQnpB?=
 =?us-ascii?Q?R0VBYkFCbEFITUFYd0JoQUdNQVl3QnZBSFVBYmdCMEFGOEFjQUJzQUdFQWJn?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhNQVlRQnNBR1VBY3dCZkFI?=
 =?us-ascii?Q?RUFkUUJ2QUhRQVpRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFB?=
 =?us-ascii?Q?QUNBQUFBQUFDZUFBQUFjd0J1QUhBQWN3QmZBR3dBYVFCakFHVUFiZ0J6QUdV?=
 =?us-ascii?Q?QVh3QjBBR1VBY2dCdEFGOEFNUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFC?=
 =?us-ascii?Q?ekFHNEFjQUJ6QUY4QWJBQnBBR01BWlFCdUFITUFaUUJmQUhRQVpRQnlBRzBB?=
 =?us-ascii?Q?WHdCekFIUUFkUUJrQUdVQWJnQjBBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSFlBWndCZkFHc0FaUUI1?=
 =?us-ascii?Q?QUhjQWJ3QnlBR1FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFB?=
 =?us-ascii?Q?QUFBQ0FBQUFBQUE9Ii8+PC9tZXRhPg=3D=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 146e4683-2857-43e1-e70e-08d771b3936d
x-ms-traffictypediagnostic: CH2PR12MB4150:
x-microsoft-antispam-prvs: <CH2PR12MB415082931AD0990EFB4D9935AE4A0@CH2PR12MB4150.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(376002)(366004)(136003)(396003)(39860400002)(346002)(189003)(199004)(43544003)(54906003)(11346002)(55016002)(186003)(86362001)(14444005)(256004)(9686003)(6916009)(4326008)(14454004)(6436002)(8676002)(81166006)(81156014)(305945005)(7116003)(2906002)(25786009)(478600001)(7736002)(8936002)(74316002)(52536014)(6246003)(76176011)(7696005)(99286004)(316002)(3846002)(6116002)(33656002)(5660300002)(66476007)(66556008)(64756008)(66446008)(76116006)(66946007)(102836004)(26005)(71200400001)(71190400001)(66066001)(229853002)(6506007)(446003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4150;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: TjupaF7YWPhRd0ZpKhVQa62WrempimfaDPUryCO/yahgJDHx00Xm+M/oUkda5nq1F+Bxv11gMzzv1ff2wnvPiUqP2EN1IXPq1hUo6+msbLHDuv+jtXOKkONPs+ESOtZl/Wjyz1CKFno59KC/1366/dT5SnRjIBtrmhs5u5Pa7nEreNc2sbK5HsO9kWthXTRwRZa/W9LaNOr3jfyhcxQtdJ6OtRd+8xqE+sIg/IFt/0jA8X+6CS4tplab3xKmViL8x0Foh/KcSCAyFdvFlWvx/h3wKk42hKBw3/8q+Wvolt2IVzu0wleB2gvrVNu0XIQ1WOzfEQMCw4YEbDrO+RJKc6y49dI9zKKeqfr2HUEg4CoY3ofYl9xIHY1kk2Shnm167R1yiLxMQ0Y+272IiFPXvZF//dJp2m9t8IFHwSL8woPd6W45aTndkjBzuwCjUR+J
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 146e4683-2857-43e1-e70e-08d771b3936d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 14:27:18.1149 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E71PUQQsGfo37GV087AqJlPh5b2wucmQLTfctEITqjlEVFIEwEMcPC6WAScYgogQuwgzMUn79UzseamAVfEZuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4150
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_062721_812913_FC941416 
X-CRM114-Status: GOOD (  17.98  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux I3C <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Cc: Przemyslaw Gaj <pgaj@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, Nov 25, 2019 at 13:09:36

> On Mon, 25 Nov 2019 13:00:17 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > > > > > > I'm pretty sure we solved that already (that's what
> > > > > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > > > > Can you be a bit more specific? What makes you think the master might
> > > > > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > > > > called?    
> > > > > > 
> > > > > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > > > > secondary master already owns the bus. Main master can ack the MR request 
> > > > > > and not send the CETACCMST immediately.
> > > > > >    
> > > > > 
> > > > > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > > > > status and after I exit from ->request_mastership(), I'm the bus owner.
> > > > > If not, error exit code is returned and we can't make the transfers.
> > > > > Are you able to implement the same behavior?    
> > > > 
> > > > You can assume everyone will do in that way. What happen if you receive a 
> > > > request or an information from current master?  
> > > 
> > > We have this ->request_mastership() method so controllers that have
> > > this logic (MR+wait(GETACCMST) automated can still interface with the
> > > subsystem.   
> > 
> > I can also poll the GETACCMST but we are assuming nothing will happen 
> > between MR and GETACCMST.
> 
> Nothing coming from the master that tries to acquire the bus, yes.
> Nothing coming from the current master, no, and that shouldn't be a
> problem as long as those operations don't involve acquiring bus->lock.
> And if some of those operation involve acquiring the lock (I'd still
> need to understand which operation that would be) they'll just be
> delayed/rejected.

You are assuming this is straight forward which is not the case. Between 
MR and GETACCMST may happen everything as in a Master-Slave topology.
For me, poll the controller to check when GETACCMST arrive and lock 
everything is not a solution.

> 
> > 
> > > If your controller handles the MR/GETACCMST separately, it
> > > shouldn't be hard to implement, and we can even provide an helper if
> > > people end up duplicating the code.  
> > 
> > I already implement a callback in my code so each controller be able to 
> > do their stuff in that in request/deliver mastership.
> 
> Can you share some details here? What would those callbacks supposed to
> do and when would they be called?

My understanding is that different controllers may have different ways to 
deliver the bus ownership hence I implemented that.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
