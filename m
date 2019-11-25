Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13867C432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 13:00:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D59722082F
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 13:00:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cwssDQOZ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="IyP2FrSG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Kvyb27PY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D59722082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DyBnqCHWS2zz76Rs6tv8mP7cXPWbRimgkTl4eSbpTYo=; b=cwssDQOZByVoi1
	/eBEkNa3wf921hE2sWdas81tB4GCZddzJIWXOTuqttqJ42xy4oQEIei2z9AAsOXotmoDpf2eGLZNp
	VRJfqiVB0u33JwCOfp3AfHrsJS10orfMC6wTUFC6/xZ9CEJw1TMnsewMvttEcrAJvKpXX06LZrWr9
	KV1+iy9+QATU20DI3LD43JkyiiNC7KXVvHFqR92JtBfjSRNoNDAHG5MZkCej1Oq8VG7K1JQ2lB0lt
	mb6TR0gZ9xTEWKedr7EfkYgEjd19TWPzCSsax5DRQj3yjhEJWFZYJqr8PMKhunxWM77cJ1jBmjRfd
	WwNwbUmmkucPzowmpbvQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZDyg-0006J5-Gh; Mon, 25 Nov 2019 13:00:30 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZDyd-0006IU-Ee
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 13:00:29 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 446DEC26DA;
 Mon, 25 Nov 2019 13:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574686827; bh=L8Q26Hys8TIBqbSt5l88GrdTwZCMQCXRqrHgkom8P0w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=IyP2FrSGK1zQF+qy/ElMa3lReYi3savPE5Pfsxf+8jBUSmE/9OP88R5Z+v6chcU7L
 R5LNxqqrYq/X46exjPn3h4W8poxnSpAvdbdb4Pf1HANGeFsE49gahV+BWmT24fOFMz
 6MmO5vx4HbpHOzXCXD+UjIsLP6Y3gbU9rlunDO35SOSk4WpGqfnWZ63OA0NWdRULDO
 DvUphfyFAN0zXeD/YkVGYP/dym0Hb/5uxALpRI+zuGLIi4+ZTPD2mbP5K6pnZ/u7FU
 TFqPHzZXZwFPqZccbCEDD+clTwIaR84KvsO4mWSaFigD8TfVZJXR8Pel2EKbu8XpnH
 ffW62iWqoX/YA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 2E7FCA0142;
 Mon, 25 Nov 2019 13:00:27 +0000 (UTC)
Received: from us01hybrid1.internal.synopsys.com (10.13.188.44) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 05:00:19 -0800
Received: from NAM01-BN3-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.13.188.44) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 05:00:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LGHVJxptqX48zp75wW+twpv6JqPN75Tj/QVQX03IhJhpYo/fVhyW0daKCT0NiqYdtiOHFqqCMWxZCM9P12fqHL4YkVOJnD8Ob38hn+jvS5gBSzjHnYRFjebJyPIw5YtwuD9yedt27vK3ImCZJD4UC/IaFRAgl8WhhbxUAt1182B+DSKXp6Ut3fUsYKY/cmyXxsjQWpHenrrSC1TkYaVjmRhscwVKX2All4ezaPYThYm96pj3P9SjI8UY06233ZcK57NJMsp7SmH/1bZVTfWDX2EvbYMEZsxUJZF5mgrG1nJiTOvZMQW8mrxvFhc3QSyEFI7+dNkiJhe5z6kE5WoUug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5glz1ONM3MMqGZTaLBDnr2nGwS+N2gOzQxslWVILCk=;
 b=glCU5npKk3UC4APGeMzDB+Ei2Qfyoq0RH/gdeGrH1DoUGBcPGgHUdURcObpxa59EiCKXW3RdC4XPwzpZ5DYbTcbVAVOqedR/q5x0Uo54LjMM3NghSgqS921QsaqxNEI0aR5wGa55jFR4mWDUtkHy2IRefGkM5bQnOmBxkU1ZWn4vDUmeI7DY6/Lpb6BlGXdjYCBGrc41MhBXNa/5PXe3buFB/ZG9qa/67sEaEhC5hW+t8Ca3ue2E5QSSP8NqLJ3ZN2MgJ/+m0DclPRaQd9X4otyiVLaEjBfHF+2ruDgdxZ+4VhYK2R4fcPn6Niz0K+gJ6/Xatrrv4oojvAu6DP/t7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M5glz1ONM3MMqGZTaLBDnr2nGwS+N2gOzQxslWVILCk=;
 b=Kvyb27PYvRjo7jBLxhztKhthlkddkyYwdbw/k8rLiFX5pccdENS3RFlrFwKJaIESAI7VpsgkXjHeaHoT+p1V9YrvhRuGkHOeujs1x6MVbakFj//YNsLKU84qp/4Z2dlDSzU3piOPkCHjx1QaF9QrWzZPCGYK17AhJGHlHp7FWKo=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3910.namprd12.prod.outlook.com (52.132.245.87) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.19; Mon, 25 Nov 2019 13:00:17 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 13:00:17 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wIAABiYAgAAAhVCAAAUuAIAAARUggAAGeoCAAAYHIA==
Date: Mon, 25 Nov 2019 13:00:17 +0000
Message-ID: <CH2PR12MB421644B0CAB1DEF50675995EAE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
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
In-Reply-To: <20191125132219.2e45d084@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctODQyMWIwOWMtMGY4My0xMWVhLTgyNjgtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDg0MjFiMDlkLTBmODMtMTFlYS04MjY4LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iNTAzNyIgdD0iMTMyMTkxNjA0MTUxNTg0?=
 =?us-ascii?Q?MDkyIiBoPSJpQSsxRHRJczBaUGgvc3p1RVRxbEUvVW44YjQ9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJj?=
 =?us-ascii?Q?aGI1SGtLUFZBYml2RGFUYjVUR1F1SzhOcE52bE1aQU9BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 88b5b0e1-7092-49dd-ce4e-08d771a76b89
x-ms-traffictypediagnostic: CH2PR12MB3910:
x-microsoft-antispam-prvs: <CH2PR12MB3910398287332620F0F9EE2DAE4A0@CH2PR12MB3910.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(366004)(39860400002)(346002)(396003)(376002)(43544003)(189003)(199004)(66556008)(64756008)(66476007)(6436002)(76116006)(2906002)(66946007)(6916009)(8936002)(52536014)(25786009)(229853002)(55016002)(8676002)(9686003)(71200400001)(71190400001)(66066001)(81156014)(33656002)(81166006)(6116002)(4326008)(3846002)(102836004)(6506007)(316002)(7736002)(7696005)(6246003)(186003)(26005)(11346002)(5660300002)(54906003)(256004)(14444005)(7116003)(74316002)(305945005)(14454004)(478600001)(66446008)(99286004)(446003)(76176011)(86362001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3910;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: pdBulCjNZ7mWiY/HVIX6BvQUL/VNnEbh03nJ36RBp1Aol8niSQKJEIfLxpeYuIqZZuQtUugZILzGcGzZFZFaxuthX9X8X4/wl+nIcEPdgPzm6CH0BJoABr9GV43ddQpkzNfOr2k/Kmo+4xdnho+bs5L4DWYBBI3rAE126YciF1A1WWEhf9RpA/kRp6tkw0z9tQUcWLJI4Mqzaak/KqzWj8oeXZIl4FLYYTTDhReOjcWFbej1dPg5dwB2zKaZbOlOGxVrzO17nd0Mt3z+hV1T/gea1JfjOWDAKcCf5PaksEYFgqbronFMPgk41jbRkuHuA8QUJl0ixom5Bzv0J5j6jvEgK5Aino8dTGR+2IB0xNJg0QiFC5lzRN8uI974j9SlD9FbKg0mn50WDNyEWfbJBXldceKElVKjRzX8aNlF54cahj3Bwk3Qiwj+MkE7udfu
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 88b5b0e1-7092-49dd-ce4e-08d771a76b89
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 13:00:17.2550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6I86aUN3yMcf8WUUiMD8ZSgux8SnauFpe3qGbevKf2vq0Nk8kcrUYsrZADKxuz3bRJ0C0Cs+xbc9+NzE331Ahg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3910
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_050027_506260_256924D6 
X-CRM114-Status: GOOD (  17.03  )
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

Hi,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, Nov 25, 2019 at 12:22:19

> On Mon, 25 Nov 2019 12:03:42 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Mon, Nov 25, 2019 at 11:55:16
> > 
> > > The 11/25/2019 11:42, Vitor Soares wrote:  
> > > > 
> > > > Hi Boris,
> > > > 
> > > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > > Date: Mon, Nov 25, 2019 at 11:34:52
> > > >   
> > > > > On Mon, 25 Nov 2019 11:19:44 +0000
> > > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > > >   
> > > > > > > > > > 
> > > > > > > > > > I based in all version and tried to pass everything to master.c file.    
> > > > > > > > > 
> > > > > > > > > I'm not sure what that means, but okay.
> > > > > > > > >     
> > > > > > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > > > > > driver want to access to the bus but I believe we can discuss that after.    
> > > > > > > > > 
> > > > > > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > > > > > but sure, we can discuss it after your RFC has been posted.    
> > > > > > > > 
> > > > > > > > I need to test if the time that device.c request the mastership and the 
> > > > > > > > controller has effectively the ownership of the bus is short enough to 
> > > > > > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > > > > > housekeeping of bus takeover.
> > > > > > > >     
> > > > > > > > > 
> > > > > > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > > > > > first one to post a patchset and he never really said he didn't
> > > > > > > > > want or didn't have time to continue working on this task (not even
> > > > > > > > > mentioning the time I spent reviewing those patches...).
> > > > > > > > > 
> > > > > > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > > > > > some kind of coordination before the patch is posted).    
> > > > > > > > 
> > > > > > > > Honestly it looks like I'm competing on this which is not the case.
> > > > > > > > I just pointed out my concerns about this adoption because I see several 
> > > > > > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > > > > > master code and integrate in your solution.
> > > > > > > >     
> > > > > > > 
> > > > > > > Can you point me to the version of the patch your changes are based on?
> > > > > > > And also, can you tell me what issues you faced? I would like to check
> > > > > > > if they are already adressed in my code.    
> > > > > > 
> > > > > > I used v3 and v4. From v5, I found useful the switch case (request, 
> > > > > > deliver, handoff, takeover) in hc side.
> > > > > > 
> > > > > > I didn't hardly test how device.c request mastership but I suspect it 
> > > > > > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > > > > > not be the master yet.  
> > > > > 
> > > > > I'm pretty sure we solved that already (that's what
> > > > > i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> > > > > Can you be a bit more specific? What makes you think the master might
> > > > > not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> > > > > called?  
> > > > 
> > > > You are assuming that after i3c_master_acquire_bus_ownership() return, 
> > > > secondary master already owns the bus. Main master can ack the MR request 
> > > > and not send the CETACCMST immediately.
> > > >  
> > > 
> > > In Cadence HC driver, I'm waiting for GETACCMST longer, polling the
> > > status and after I exit from ->request_mastership(), I'm the bus owner.
> > > If not, error exit code is returned and we can't make the transfers.
> > > Are you able to implement the same behavior?  
> > 
> > You can assume everyone will do in that way. What happen if you receive a 
> > request or an information from current master?
> 
> We have this ->request_mastership() method so controllers that have
> this logic (MR+wait(GETACCMST) automated can still interface with the
> subsystem. 

I can also poll the GETACCMST but we are assuming nothing will happen 
between MR and GETACCMST.

> If your controller handles the MR/GETACCMST separately, it
> shouldn't be hard to implement, and we can even provide an helper if
> people end up duplicating the code.

I already implement a callback in my code so each controller be able to 
do their stuff in that in request/deliver mastership.

Best regards,
Vitor Soares


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
