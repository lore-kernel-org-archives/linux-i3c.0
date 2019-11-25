Return-Path: <SRS0=Pvy7=ZR=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39B6C432C0
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D212068E
	for <linux-i3c@archiver.kernel.org>; Mon, 25 Nov 2019 11:43:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BYEqJpmF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="cBg4aoN/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="Feh7526u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D212068E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2EM+P67MZSY030kCIwqRYZimbyVljE2aZVbRhgJFrMs=; b=BYEqJpmF4vMjCP
	mF71B3lRH6AVX7xRE9KRi5mis1InhS9a/o4aUDwxBLDa1bc+LirNiM/0WSWy4MtMOGuqMx+HAhqHS
	A+Csi/06uJ31lh0VjQtt4ItZKF9Qbf5WYauPunq+YPHDu3+aD16J5M1fWg3m0rlhmMj49T9CHc4v6
	VSNG5fF4NTd5m1GSM0Ymy3Q7l4NBxtxxVKRKd0JpuDC97JPU+VakEkKTgLV3K56tGll8TA5erRNra
	bnFh9az1+niUkEveOHasl74zEFgnTuIUyNWUIG2b8Djm7//RkjqodOVP2scVoYqe6GJIpSsnA6pH+
	yhAgN5k7/wcZzpZvrkUg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZCm4-0001VI-BE; Mon, 25 Nov 2019 11:43:24 +0000
Received: from us03-smtprelay2.synopsys.com ([149.117.87.133]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iZClN-0001TO-IB
 for linux-i3c@lists.infradead.org; Mon, 25 Nov 2019 11:43:01 +0000
Received: from mailhost.synopsys.com (badc-mailhost2.synopsys.com
 [10.192.0.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id F2CF8C00E1;
 Mon, 25 Nov 2019 11:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1574682161; bh=UgLC6SLofdUD9t+bFesatzmGdF4kUzdohJKh3qO5arE=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=cBg4aoN/0hMtVHkWoXN+8zi0gW9L0Q0zzXlAsY2jb4Ykl3DU8vcswoDR3m5L88IUA
 PFtxhH+QUoe1Jr77sg0wcWtc2HAw0IRou/D4HQJB+4Y2p0RnM9q9ZpIowzxUeit+71
 wzXL4sPHMVuOo6AzRJndaUQksqB1LGFyxuGnri7aDKLlNL2ax+q4svdShGpwVInXWa
 41vEz/XtdHUyJe0Q8aJE80qjF3i3G+zKyDW6BuJHG1PGK+XnUGL7eMtOoLeyQsPKc9
 n974m1g5LDaTN7PS8gbXfy+lVFxT24b/QL/HxPyBKhmO58fN0Wii5ai17oI3cTKPXt
 LmC/I5+hjTxCw==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E8C66A0066;
 Mon, 25 Nov 2019 11:42:38 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 25 Nov 2019 03:42:38 -0800
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.13.177.249)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 25 Nov 2019 03:42:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uc1V1W1ychhxPsHZI2SZYY/l4Dd4BeKrck6H76pfkMKsJxs6P0qvL6TNV1oew7aU+zhvLraBjsAUX+doYhaTXjg9JDCyRdjCt+xyyPAbBPgCCWZu5PS5BC5QbGHQASxU4gRTgCEHRcK1O4N/zpwrVawYuQ4VRHQ93FdHTH2aaMJ2ecWdgOhWl5e2A2rwubj7RnX67iP/iqI5QhxOtVP/b+yjifB1pKVqv1quN0voB1xBMZ4lWI26hwf8Gs+jqTHvA9h6IDBlq2ziY0sMOlIogkqsFb9QLwkEmRrKePh3DnMuFhETXT82o8O1yVp6IJclvYLEJ5SHO32vVC4EOS/3Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvpIdZULPorV+nk4Tuxyj3U3ybysu2S3okiVD2Y3+WA=;
 b=hV/rnNbNiWYNBpE+27gtIO+xzk/vRmhGYfHW+Z1KzQ8d3plzhNfc/+x5gZURw30U2XzYogAaqLKHcgGKKi8v4fIHv8Mo4GHOupvG8cb2UQwS3Lq9gtpLzyQwa1/9XjRcmt8H81UyeviTugNOXKhAviSijMZ8CcHYAir4aa9m6h6AMWCZaoJib/AxTtMkkn3LB1S15Awfwtt7FnUalwFkZowH3VXB9eakvCfSQ+u1gVdI5/2UFBYmck08xlq6tnlw7cK14J8EU/3v1IXPkg4STGo/FoS92McCjr7y77OxX4LZA2yBQ7toLxtk0U/IKLnvGV+6ypJPPW3pVqPtq6Sg5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xvpIdZULPorV+nk4Tuxyj3U3ybysu2S3okiVD2Y3+WA=;
 b=Feh7526u29xmmA9n8AnSwzX4fRz1DV/21eUNvf2DLDqnGM9E+/xUuqwdAXKrbTifLtQmslPu6T3hbpPJI9Zwq/TY5H3IHyXsmmZsyrb6kadrK9l5/fgP9rjqyz3PdKwltJM62MH2BswG5DV4qKqbWW5D4WPMfpR+UWlWE26gi1M=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3799.namprd12.prod.outlook.com (52.132.231.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Mon, 25 Nov 2019 11:42:37 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2451.033; Mon, 25 Nov 2019
 11:42:36 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Subject: RE: I3C Mastership RFC
Thread-Topic: I3C Mastership RFC
Thread-Index: AQHVlIVa4QcmTc+q2UG5qCkIh6FGQ6eEOpeAgAGlHeCAAVBvgIADCysAgABYbgCAABJPAIAAFgcwgBDoOACAADU5wIAABiYAgAAAhVA=
Date: Mon, 25 Nov 2019 11:42:36 +0000
Message-ID: <CH2PR12MB42168C76A833F1401A597E65AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191106093315.GA21952@global.cadence.com>
 <20191110113005.57dcff8e@collabora.com>
 <CH2PR12MB4216A050B76E53194759822AAE740@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191112084127.6efc6fac@collabora.com>
 <20191114061011.GA25288@global.cadence.com>
 <CH2PR12MB42168DCBB3495AD92E8231D1AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191114133214.0b6ecc0a@collabora.com>
 <CH2PR12MB4216E136A2EBB0A2777C6212AE710@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125080220.GA30630@global.cadence.com>
 <CH2PR12MB4216552AAF9BFDCE498837D7AE4A0@CH2PR12MB4216.namprd12.prod.outlook.com>
 <20191125123452.7c2549dd@collabora.com>
In-Reply-To: <20191125123452.7c2549dd@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctYTlmZDM5OTktMGY3OC0xMWVhLTgyNjgtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XGE5ZmQzOTlhLTBmNzgtMTFlYS04MjY4LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iNDg3NyIgdD0iMTMyMTkxNTU3NTQ0NzI3?=
 =?us-ascii?Q?MjM5IiBoPSJ5SWxLbGRCVDZTaWxHR1hnWXIvYk41SjVlRk09IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQURI?=
 =?us-ascii?Q?VXNKdGhhUFZBWjlVYUU2SVFaT2xuMVJvVG9oQms2VU9BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 52dab597-82aa-45e4-45d3-08d7719c91b9
x-ms-traffictypediagnostic: CH2PR12MB3799:
x-microsoft-antispam-prvs: <CH2PR12MB37996ADFCBD2EDE1AA7F86FBAE4A0@CH2PR12MB3799.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39860400002)(396003)(366004)(346002)(376002)(136003)(189003)(199004)(43544003)(76116006)(52536014)(71200400001)(71190400001)(66476007)(66556008)(64756008)(66446008)(6916009)(6246003)(3846002)(6116002)(5660300002)(86362001)(33656002)(561944003)(305945005)(7736002)(8936002)(478600001)(2906002)(7116003)(256004)(81156014)(81166006)(55016002)(14444005)(4326008)(14454004)(8676002)(66946007)(6506007)(102836004)(26005)(74316002)(316002)(446003)(7696005)(6436002)(76176011)(9686003)(11346002)(99286004)(229853002)(66066001)(186003)(25786009)(54906003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3799;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1erckWVCgFCL2QMIhwkcg1KMEdeOERIgntwVQR1TjfUAfVcFJ5VTFiHJNb/tB/E/LPsn6Ha+YiqsPodbG+y2S6V0fQWxQa+cIpR8YSTGb71WJEKq0zntdv7dCaKd3nmXtQ3T4PX4ccIrbGt3XOjem2moZZNTTF6CvOEw1tZO4LUPt4Jm4ON2q0cC8n0SBs8wiT+QXsE6HcwnQh9H6FASpzIiBK68Y6UZgGmnIt0JjoeqL0ww5mh/9PMQJV9aj+Tpcf4hd3mjCHvUNL4PW40/J4kdH3+7zv2SNncV1oS8/Lp6olLdtEXF5vPhMtDvyjwtP5rD4xQ1lZ1wGGa9y0G7qKFaVbxJOWjCWeYJhu+CePrbYSbQew6n7VJmwPsfw5gzLizwYDXzraN42z1hBYgyn5xrV4vkBidplFd5T4h+YqhTeHVYZQ1APG9Ud1yZokf8
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 52dab597-82aa-45e4-45d3-08d7719c91b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 11:42:36.9461 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 2FCgXsz+ZdAkS2N3rUGXIWLfFVrfrBwSpeWHYiLMW+l+t5qay6IMejyELFW24AAPaOs68Mo6iZ/DoATAyz+M/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3799
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191125_034250_575390_FC87E30A 
X-CRM114-Status: GOOD (  23.37  )
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

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, Nov 25, 2019 at 11:34:52

> On Mon, 25 Nov 2019 11:19:44 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > > > > > 
> > > > > > I based in all version and tried to pass everything to master.c file.  
> > > > > 
> > > > > I'm not sure what that means, but okay.
> > > > >   
> > > > > > Right now my challenge it to trigger mastership request when a device 
> > > > > > driver want to access to the bus but I believe we can discuss that after.  
> > > > > 
> > > > > That's kind of a basic feature when talking about mastership handover,
> > > > > but sure, we can discuss it after your RFC has been posted.  
> > > > 
> > > > I need to test if the time that device.c request the mastership and the 
> > > > controller has effectively the ownership of the bus is short enough to 
> > > > call i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers) before of all 
> > > > housekeeping of bus takeover.
> > > >   
> > > > > 
> > > > > Note that I'm not super happy to have to go back to square 1 and throw
> > > > > away all of the work done by Przemek, especially since Przemek was the
> > > > > first one to post a patchset and he never really said he didn't
> > > > > want or didn't have time to continue working on this task (not even
> > > > > mentioning the time I spent reviewing those patches...).
> > > > > 
> > > > > If Przemek is fine with this situation I'm okay making an exception,
> > > > > but be aware that it's not how we usually do: the person that posts a
> > > > > patchset first leads the thing (of course, it's even better if there's
> > > > > some kind of coordination before the patch is posted).  
> > > > 
> > > > Honestly it looks like I'm competing on this which is not the case.
> > > > I just pointed out my concerns about this adoption because I see several 
> > > > issues on it. The point is, at the end you can pick some parts of my sec 
> > > > master code and integrate in your solution.
> > > >   
> > > 
> > > Can you point me to the version of the patch your changes are based on?
> > > And also, can you tell me what issues you faced? I would like to check
> > > if they are already adressed in my code.  
> > 
> > I used v3 and v4. From v5, I found useful the switch case (request, 
> > deliver, handoff, takeover) in hc side.
> > 
> > I didn't hardly test how device.c request mastership but I suspect it 
> > won't work properly. When you do i3c_dev_do_priv_xfers_locked() you might 
> > not be the master yet.
> 
> I'm pretty sure we solved that already (that's what
> i3c_master_acquire_bus_ownership() calls are supposed to take care of).
> Can you be a bit more specific? What makes you think the master might
> not be in control of the bus when i3c_dev_do_priv_xfers_locked() is
> called?

You are assuming that after i3c_master_acquire_bus_ownership() return, 
secondary master already owns the bus. Main master can ack the MR request 
and not send the CETACCMST immediately.

I was thinking to delay i3c_dev_do_priv_xfers_locked() with a work delay 
or so. Do you have any idea?

> 
> > 
> > >   
> > > > As I said previous for I3C spec 1.1 secondary master received a big 
> > > > improvement due the misunderstanding published in 1.0 spec. I don't know 
> > > > any other protocol that implement such kind of feature and for this is 
> > > > from far the most complex feature to implement in SO based systems from 
> > > > i3c spec.
> > > >   
> > > > > 
> > > > > BTW, you mentioned working on a lot of different topics, but most of
> > > > > them were left unfinished (userspace i3cdev interface, I3C slave
> > > > > framework/API, ...).  
> > > > 
> > > > The i3cdev does what we discuss during the proposal of i3c subsystem and 
> > > > only expose i3c device without device driver yet I'm not happy with 
> > > > transfer struct.
> > > > For the tools I have for hdr and sdr transfers, for now I didn't feel the 
> > > > need of a tool for ccc (but for testing purposes it would help a lot).
> > > >   
> > > > > Any plans to post RFCs on those aspects anytime
> > > > > soon? I mean, there's plenty of topics to work on, and I'd really prefer
> > > > > that each developer work on a different topic instead of duplicating the
> > > > > effort...
> > > > > 
> > > > > Regards,
> > > > > 
> > > > > Boris  
> > > > 
> > > > Best regards,
> > > > Vitor Soares
> > > > 
> > > >   
> > > 
> > > -- 
> > > -- 
> > > Regards,
> > > Przemyslaw Gaj  
> > 
> > Again sorry for the delay. I will try to send this soon.
> 
> Can you please share what you have now (even if it's not finished) so
> Przemek can start looking at it?

I will try today.

Best regads,
Vitor Soares


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
