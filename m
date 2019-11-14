Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40884C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 14:17:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0FB15206DB
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 14:17:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hhKDX2iQ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="Ea1iUAG/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Fh3hDrWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0FB15206DB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WNqWQG4QlO88/R8oseQiZ+aXr9NhjwOWsSKOL2TC3qg=; b=hhKDX2iQFdtoSS
	sxjfa65u9aJGfzf5yjI48Mq006AlSS/VO/GAyPdzqm6e6mRuGb71RNYBczdCTEH9Df8dcFKOUdmHQ
	BWLu/n3rr1m1u2VHSuUrzf2CCOWJCFBpqd7A+TZNrjpx42ImcdSX3YKqf01wLPMiOCAHXbMfejkiB
	BBBRgQXFpJoTxTlLAkvs8ET0p8MF5oeTJ87TphaKXnSrGUMhXJlziw9TuUHpNENyTH2qVK9OU7PeL
	kEAU+y2lQJoFK/huoGM5y4jeM73ikTPFrbJVi6aXx/p7/kMG4ahk/JffTlDRdnOoiO1QZCqA59SDR
	Mpv4TFnPQlLfQPN4ml8Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVFwV-0005dr-Oz; Thu, 14 Nov 2019 14:17:51 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVFwS-0005dK-SD
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 14:17:50 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 350DCC04C4;
 Thu, 14 Nov 2019 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573741067; bh=00SuK+a554FlgLJ6s5Dit+mwl/QVpj1NvrORolrv5rE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=Ea1iUAG/TW1ZhWcIQgNw178AhdsyodEzGoddLOstg3N9UCLEbaI/5GNqHYvLM2RpM
 U4eUQ6RbeVcfUW0wI1NzEWdQ/3BazS4ufa/4bCn9SXWVjeJZrhqP8e1nv5urq142wJ
 dAtvmtF6yHjL5rHMyzXpL5r0S1cCkpZc2xXEKSykkUU1X5HrTHbxp2XMqrGPi8B1sm
 maetLBimTbu4h5xsGhejotWTSLgpBFXpaZTG+ehZ2Utwf4n5R0MIotOUMEFwGOTcs5
 uKuJm+rZAv6qi3kA725Cm1u9AfMddYOQw6ota//dlJRqUEbT8JY7xEmc+GUqIErVWB
 /1NaRaP0re76g==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 97A6FA00AE;
 Thu, 14 Nov 2019 14:17:46 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 14 Nov 2019 06:17:40 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 14 Nov 2019 06:17:39 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ef90BWs9v+jnLsUjpOFtOh2zcf3NbNfJkImM0DfvN615NXpUXzkZgKIWlAoq8lV9hAPYUmUc+GXwhikmZBl6uvn3l697eL4QRWYwrixgyHWTwJJJpF4cj/c0Y681qyZqGkAxWXYVSUzK2/8pWU1GKkx/3bvzoXR/d+azjrU18ziNLjf0q7s9se3VHoCMh4uVtuP/3Ey2zFjjbQm8ZOy7C+jqDnK/0ppLiircZVmQSMQRbbbzNR1WZeqRdTaD7IzPMHZHUrU0hf9aZ4hAV+5FTjniOfdjBc8vJPTHaCe72ljod3h3c0rNCYl4+9Lxw+aXX42QkmI7lPyPtbLfdYtynA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khG6ZtcUWSSVGKkt9IjVbp9KH10p1UZvBWoBLDnCRjA=;
 b=Kg0uiRhnmYfcSwnZViXgVO1N8tyAKRje/NFkC5031zN5OpszKGIgz1oiDjuCM0G9yUzUqHCLvW21A3L7/a6uE++zqLW5wBb3pdGdI4muFSGX2zg5GAFOY0puiozsXJsz7ycqLghKj8q/6ri31uurytVcoX7a4C/cwB2GDqCHhkHrkiov5rLPk9VyDSHHKlweN3QL6zAuw5sxI+nlfg0VwvcTU6UlUJpcf2B294mREkds94mfKfSjbOF6l7rRRXTxUN7yDvrN+RdqCcu0eAvq2jZLQPO2m+hAfrIT5Phfj9P4f+KK3Pr9z3AHvW+ppLkj1B5c7RhjJEazOe3sTsSHOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khG6ZtcUWSSVGKkt9IjVbp9KH10p1UZvBWoBLDnCRjA=;
 b=Fh3hDrWxPn+YOQuaJwByWy5WUfRGbTBjB7ovD16dIcgX26nUk2E9BY2bkbuyNMvKrs1iHMuMDIjPEozkcg6GnjgL+0sXc8WYGBFFlNexU/hdTMv/KiA3JZbXIV5iAW9TBkW/e/7gn2EGbWyNhg1nKUhcTD22QkRqrAxoukDgoDw=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB4279.namprd12.prod.outlook.com (20.180.16.88) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2451.26; Thu, 14 Nov 2019 14:17:38 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 14:17:38 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcw
Date: Thu, 14 Nov 2019 14:17:38 +0000
Message-ID: <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
In-Reply-To: <20191114133214.0b6ecc0a@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctODAxNDlmNmUtMDZlOS0xMWVhLTgyNjUtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDgwMTQ5ZjZmLTA2ZTktMTFlYS04MjY1LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMzkxMiIgdD0iMTMyMTgyMTQ2NTYyNDEx?=
 =?us-ascii?Q?NDc1IiBoPSJpV0JMZE1EVnlqbFVERWY1RGM2TjZNYU5RQVU9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQURU?=
 =?us-ascii?Q?UzRCRDlwclZBYmcxRmVnU0d1dWx1RFVWNkJJYTY2VU9BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: ed07bb4e-1f2b-4fd4-2377-08d7690d671d
x-ms-traffictypediagnostic: CH2PR12MB4279:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB4279B7366480C88DA3A4E967AE710@CH2PR12MB4279.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(366004)(39850400004)(376002)(346002)(136003)(199004)(189003)(478600001)(6506007)(9686003)(6436002)(26005)(102836004)(186003)(7696005)(76176011)(229853002)(55016002)(7116003)(3846002)(6116002)(66556008)(33656002)(561944003)(76116006)(66946007)(66446008)(6636002)(66476007)(52536014)(2906002)(110136005)(54906003)(14444005)(256004)(316002)(5660300002)(14454004)(71200400001)(71190400001)(64756008)(74316002)(66066001)(305945005)(81166006)(81156014)(486006)(6246003)(86362001)(25786009)(8676002)(11346002)(446003)(8936002)(476003)(99286004)(4326008)(7736002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB4279;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3meogNFRnlOyt67rOSeqXlxNgz8Opti0szEqWBRoPDqlFEcmsrpdRNlNzKOCaPg7sBlqbc9TNGaZ6jQGtY1A+wgExT/FaJUXS6+EDtUksYwf9ZeCmH4F9NYO/CGvrkqh9/GXVkPucyySH+wGKUWBcOL9jNbJtb8rvKrIHUgvPfx1VoSEf9fJInlBHfDY8Cu3o7PUWkDOlflDShnDeHMjfwsfwdEtHRisc6G8Qh4g10XfZw3VkLkymy2buoq+kfuS/uvPdBg2i1q+LgCtBkqlD3+mE+eGv+Y2mbVwlla0cHvia8S7XggBPIKLEPjWDDhkYxPG2pNkGEXJSsJrtHhUpAPDE8uIXl7EdggUVIzpO3Ku/qi4Ze3hCzNOaAmf9eJ2B1JCeFlnXcOAeRsQ1L2/xXJ+Tcx/wbfnuIGq2T8gKOflBVsrpSSH6cU3ISnvdmg/
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: ed07bb4e-1f2b-4fd4-2377-08d7690d671d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 14:17:38.1141 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nPkgDqZqL6G93mEJG9Ty5xUOysSKSBEKH1A+KsOPGnswlrPwnK23ibmIFrJgbas4tQ53qHeuTx3AnbCju2wWZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4279
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_061748_982309_3B95BFA6 
X-CRM114-Status: GOOD (  22.37  )
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
Date: Thu, Nov 14, 2019 at 12:32:14

> Hi Vitor,
> 
> On Thu, 14 Nov 2019 11:56:00 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Hi,
> > 
> > From: Przemyslaw Gaj <pgaj@cadence.com>
> > Date: Thu, Nov 14, 2019 at 06:10:12
> > 
> > > Hi Vitor,
> > > 
> > > The 11/12/2019 08:41, Boris Brezillon wrote:  
> > > > 
> > > > Hi Vitor,
> > > > 
> > > > On Mon, 11 Nov 2019 12:30:45 +0000
> > > > Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> > > >   
> > > > > Hi Boris and Przemek,
> > > > > 
> > > > > I have a working version for tests purposes. Yet, I have some basic TODOS 
> > > > > to address during the takeover of the bus.  
> > > > 
> > > > Okay. Would you mind sharing a branch with this material so Przemek and
> > > > I can have a look at it?  
> > > 
> > > So, Vitor, can you share your changes? Can you tell me what you had to
> > > change to make it work? Also, which patch version is this based on?  
> > 
> > I'm closing a task and after that I will prepare the RFC.
> 
> Okay, can we have an estimate? Are we talking about days or weeks?

I will prioritize it for next week.

> 
> > 
> > I based in all version and tried to pass everything to master.c file.
> 
> I'm not sure what that means, but okay.
> 
> > Right now my challenge it to trigger mastership request when a device 
> > driver want to access to the bus but I believe we can discuss that after.
> 
> That's kind of a basic feature when talking about mastership handover,
> but sure, we can discuss it after your RFC has been posted.

I need to test if the time that device.c request the mastership and the 
controller has effectively the ownership of the bus is short enough to 
call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
housekeeping of bus takeover.

> 
> Note that I'm not super happy to have to go back to square 1 and throw
> away all of the work done by Przemek, especially since Przemek was the
> first one to post a patchset and he never really said he didn't
> want or didn't have time to continue working on this task (not even
> mentioning the time I spent reviewing those patches...).
> 
> If Przemek is fine with this situation I'm okay making an exception,
> but be aware that it's not how we usually do: the person that posts a
> patchset first leads the thing (of course, it's even better if there's
> some kind of coordination before the patch is posted).

Honestly it looks like I'm competing on this which is not the case.
I just pointed out my concerns about this adoption because I see several 
issues on it. The point is, at the end you can pick some parts of my sec 
master code and integrate in your solution.

As I said previous for I3C spec 1.1 secondary master received a big 
improvement due the misunderstanding published in 1.0 spec. I don't know 
any other protocol that implement such kind of feature and for this is 
from far the most complex feature to implement in SO based systems from 
i3c spec.

> 
> BTW, you mentioned working on a lot of different topics, but most of
> them were left unfinished (userspace i3cdev interface, I3C slave
> framework/API, ...).

The i3cdev does what we discuss during the proposal of i3c subsystem and 
only expose i3c device without device driver yet I'm not happy with 
transfer struct.
For the tools I have for hdr and sdr transfers, for now I didn't feel the 
need of a tool for ccc (but for testing purposes it would help a lot).

> Any plans to post RFCs on those aspects anytime
> soon? I mean, there's plenty of topics to work on, and I'd really prefer
> that each developer work on a different topic instead of duplicating the
> effort...
> 
> Regards,
> 
> Boris

Best regards,
Vitor Soares



_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
