Return-Path: <SRS0=SSUK=ZG=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6914C432C3
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:39:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 812572070E
	for <linux-i3c@archiver.kernel.org>; Thu, 14 Nov 2019 13:39:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mTia+sla";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="DbTM5TIr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="X5z+vqBL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 812572070E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nfhElA9zyZwKBpIrU81jMJ1XKqxbgBZC9RmnPOILCgs=; b=mTia+slajocm+e
	46AiM3PLgSdKdDl3oI2ykrl6Wh1GzxaCyvKGbjQnP4magxqGiiMCo8kNteNnzudwNAcCc8JiqLrdp
	LMo1LMPaOMBLl5C7krq/8KYyqTlLJYnXgH/IbR22p1VvT+2t3TTO2r1/vh+kYKa07X4oc8Ig8wdpU
	fIa8anvxRRZ7Dx0iXwy7qQqdA8IWUhhGMdW9Ze7IyNN9AU8ftMR6FDjZVutW12rlvyKfmnieUaqQa
	Ka2C4lyEBcGxm8Q2XPKPifMWUGyAQbDfV48EXcHVzfi+2F17mQ1tS+6zQ/TPmadKMWO3LsPcpkvWu
	VYReejQIwBkEbWskm3Xg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iVFKw-0006rh-6Y; Thu, 14 Nov 2019 13:39:02 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iVFKt-0006r7-Jn
 for linux-i3c@lists.infradead.org; Thu, 14 Nov 2019 13:39:00 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 68E34C0389;
 Thu, 14 Nov 2019 13:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1573738739; bh=5rwagRwhfDN594W5kMnH1Fx45o8iUuhuyZ43Mvqo8XI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=DbTM5TIraxPtKdtRx6Iw3YZmpqsnQu0oVNjWIZimr5L7nF/N6+iLZcE0N3xRaFfEN
 8HIRTo6S30jXe/duwLTBstHf9OilcGoL2s/AY5dFW7T6ItqnowbM8KEFb6rm7z1NGG
 e1RETpFtfsuSaNbCAK2JUolWfHKZc3MlsN9Nu/1xtv4V29g9nUnwdkt7uJGFhvbdMP
 M+xyUkYsImzTuLVXtv73wXTNFD1sYAMrX9mY36RP2/4V8mt+xGH0KzlMvGkDLEI1xZ
 5/s3WATM/oY8z3Iu3VZ/rUvXOkFQEqE9Aj45hnVtDkNdfS/M3XhIt7Np+z7uvamCW6
 Q3D04DYQETvkQ==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 561BEA008A;
 Thu, 14 Nov 2019 13:38:59 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 14 Nov 2019 05:38:51 -0800
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 14 Nov 2019 05:38:51 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nx9shU62aH006ZdCYey/txpZlQJo3fgfGdxLZ7v4jvkn+XwgnVCvBLVR3SAOKW28aZAgnZPYrS/vCMsA943dw7QPjwyDx5R/yzHI+ENuZwP0OVRry57TVVNIfWrHtShCV9qbB5A7ubdQiM34La7KcTH+hpMxCv7KnnEAvoH57Oqs8Cbjqoq5UyjdWTgdiHwcYa9rvDlZtmY6ivLBMB8CdEXGOgSgEhQS3pQYFxMxsNC0QAvkM1BFJQo6CU34cAaGJn4qPAvkzkDykSNfjU6ehvYUwrhTUD7NOZoMGyMTS/tpCSYZBwHiHcbHKXtc/1zg6Gzx5Vb5wM+PEZIR/1Ezxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxErVIdLefDU6jcKNHlfQM1qswvc3y5TYWr8n+SMUvg=;
 b=BWNkMPsttx52FJLuYytiOa9HKBYTZkMiOcrAhRNOCsGMY+QCRaoJF03KQs0M4TItoN3qr7RDxP6NSYJwEEOmxNS+LntOEBcRsKmy29YM0inSViipCnuxaxwAM0b7fu++8G80zMxxt0t/AqG8WWAwYTjSVTMkCxkUP5KTpOTYDMThqfWaHijQZ2jNHG29jAXMKiZjnaQb6JZfvn1xg8fjzJHWlGn8zRc4EEj6RLJulJERL1OWrgYPQBU5nBXb2CgmpV4P7alf9ASCJ2nvAsqzPTA9R21/sXb1FqIQWfVRRla+x3EEJmPn35sadrizixMPy1fQy8AtD+QEe0NVj+hadw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wxErVIdLefDU6jcKNHlfQM1qswvc3y5TYWr8n+SMUvg=;
 b=X5z+vqBLus+lXIpUmhedDrLpAdDtAenRT4NWPIOb7zhfGxPjoRBrkBHab2q8ObzKBHZnqMhRlUuP9KYm7/40bvr37kouCbs4tFxdbX1UMluUK8msuOIzVsCms+FAiF7ojhqpClRZV8Rqv6slffOwTcyOEdLM6EVVhZQlxwx0ps4=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (20.180.6.151) by
 CH2PR12MB3880.namprd12.prod.outlook.com (52.132.246.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2430.20; Thu, 14 Nov 2019 13:38:49 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::81fc:ad3e:6315:c6ff%7]) with mapi id 15.20.2430.028; Thu, 14 Nov 2019
 13:38:49 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Przemyslaw Gaj <pgaj@cadence.com>, "bbrezillon@kernel.org"
 <bbrezillon@kernel.org>
Subject: RE: [PATCH 1/3] i3c: master: add data hold delay support
Thread-Topic: [PATCH 1/3] i3c: master: add data hold delay support
Thread-Index: AQHVmq/K36eR+HSzX0m4t4Rkpl1zOqeKq4rQ
Date: Thu, 14 Nov 2019 13:38:49 +0000
Message-ID: <CH2PR12MB4216824169AE26D98215764BAE710@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <20191114055155.20446-1-pgaj@cadence.com>
 <20191114055155.20446-2-pgaj@cadence.com>
In-Reply-To: <20191114055155.20446-2-pgaj@cadence.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMTUzMzI0MDMtMDZlNC0xMWVhLTgyNjUtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDE1MzMyNDA1LTA2ZTQtMTFlYS04MjY1LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMTkyMiIgdD0iMTMyMTgyMTIzMjc2NDU0?=
 =?us-ascii?Q?MDAwIiBoPSJieUVKdDlJL0VTL2xERWhzREFRRzgzNHhEOWs9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJ3?=
 =?us-ascii?Q?eUl6WDhKclZBWFhMZU01TjBBNVlkY3Q0emszUURsZ09BQUFBQUFBQUFBQUFB?=
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
x-ms-office365-filtering-correlation-id: 0cb37d49-0843-4f27-b064-08d76907fb3a
x-ms-traffictypediagnostic: CH2PR12MB3880:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB38806C8A3CCE2F1F3BDEDAADAE710@CH2PR12MB3880.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1002;
x-forefront-prvs: 02213C82F8
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(136003)(346002)(366004)(376002)(39860400002)(396003)(189003)(199004)(305945005)(26005)(186003)(102836004)(110136005)(478600001)(14454004)(54906003)(9686003)(8936002)(229853002)(6436002)(316002)(7696005)(76176011)(99286004)(5660300002)(86362001)(476003)(52536014)(4326008)(25786009)(6506007)(7736002)(446003)(74316002)(11346002)(71190400001)(33656002)(71200400001)(8676002)(2501003)(81156014)(6246003)(486006)(3846002)(6116002)(66476007)(66066001)(256004)(14444005)(66946007)(76116006)(64756008)(55016002)(81166006)(66556008)(66446008)(2906002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3880;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YZu9tV2ATOprQtpd8THhZ5Qt+FJHszFsekNBj/gRIK2O5u3LWEQ88zBJ19vathCoNhvP8cbmJXvAO4g3k45VR/+Q9x1hs4nodyNhDhaX8G+SHmKv9+5XjvQviHfrz8C4qpZu+pqFEo7DuXfRYyP/V6+fXaKoXrLmz5N1Oye5YzW5rfkHC6QEG0cyHT4J7u7hG4fxQd1UzMOW8ekEHrSYBCyPt4NM+stNxK/T9nuIW2ZeiUAnYbpzMR45bhVMFk3WVoz5DTYnJ69PznRFuVp0zu5kl5YLsA3D7OZc1u/xFEwseFew0F9tW/EJF9tw5lbL6iFXn52eSLv/PxypuhV+c35CchiiZj0x8pvqnc8op0pI9KKcRWlSQwFjQZF7aznKgRv7G3ZH2Y+8eDZskHsegCyXxWAHeKrWQm737iJA9pEURjG2mNMJu57pgx6nJ4lr
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cb37d49-0843-4f27-b064-08d76907fb3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Nov 2019 13:38:49.5395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JkHQwA/gSRH6NMPbLF8xhxFK7j+GQBYsvljP3s2wwsFYRaYma98vHro2IV8fttHr8ip8x89SQm5ELCxxKklhLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3880
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191114_053859_693078_9E4B8042 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "agolec@cadence.com" <agolec@cadence.com>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "vitor.soares@synopsys.com" <Vitor.Soares@synopsys.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Przemyslaw Gaj <pgaj@cadence.com>
Date: Thu, Nov 14, 2019 at 05:51:53

> This patch adds support for THD_DEL (Data Hold Delay) to Cadence
> I3C master constoller driver.
> 
> Signed-off-by: Przemyslaw Gaj <pgaj@cadence.com>
> ---
>  drivers/i3c/master/i3c-master-cdns.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i3c/master/i3c-master-cdns.c b/drivers/i3c/master/i3c-master-cdns.c
> index 10db0bf0655a..90ea98eef905 100644
> --- a/drivers/i3c/master/i3c-master-cdns.c
> +++ b/drivers/i3c/master/i3c-master-cdns.c
> @@ -60,6 +60,7 @@
>  #define CTRL_HALT_EN			BIT(30)
>  #define CTRL_MCS			BIT(29)
>  #define CTRL_MCS_EN			BIT(28)
> +#define CTRL_THD_DEL(x) 		(((x) << 24) & GENMASK(25, 24))
>  #define CTRL_HJ_DISEC			BIT(8)
>  #define CTRL_MST_ACK			BIT(7)
>  #define CTRL_HJ_ACK			BIT(6)
> @@ -1186,7 +1187,7 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	struct cdns_i3c_master *master = to_cdns_i3c_master(m);
>  	unsigned long pres_step, sysclk_rate, max_i2cfreq;
>  	struct i3c_bus *bus = i3c_master_get_bus(m);
> -	u32 ctrl, prescl0, prescl1, pres, low;
> +	u32 ctrl, prescl0, prescl1, pres, low, thd_del;
>  	struct i3c_device_info info = { };
>  	int ret, ncycles;
>  
> @@ -1264,6 +1265,8 @@ static int cdns_i3c_master_bus_init(struct i3c_master_controller *m)
>  	 * We will issue ENTDAA afterwards from the threaded IRQ handler.
>  	 */
>  	ctrl |= CTRL_HJ_ACK | CTRL_HJ_DISEC | CTRL_HALT_EN | CTRL_MCS_EN;
> +	if (!of_property_read_u32(m->dev.of_node, "thd_del", &thd_del))
> +		ctrl |= CTRL_THD_DEL(thd_del);
>  	writel(ctrl, master->regs + CTRL);
>  
>  	cdns_i3c_master_enable(master);
> -- 
> 2.14.0

Please change the commit message so it reflects Cadence driver.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
