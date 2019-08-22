Return-Path: <SRS0=1QaF=WS=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3747C3A5A1
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Aug 2019 11:08:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6F2321726
	for <linux-i3c@archiver.kernel.org>; Thu, 22 Aug 2019 11:08:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fl9KIoXs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="iFRenLba";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="PQhXAjCK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6F2321726
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gLZq3uzNRchAfMA+GZqMcv6mC1g3Jmzhehq5lkKxIGs=; b=fl9KIoXs/gcTzR
	xs4pMTsIoxLaY+qsX1Ecm06QwgIfHFMLZTXIIPok26pl5CBWqDSJiuX+1+ahdBYOO2SudTZ965IJp
	RDCDCy7Jq3cdjh2BXx+aRwxooH4vOhabDZ1jNkkwHAPSrbjXft81JYtv4/fQtk9t/lm2vXyj354bD
	Nh9JXg5gB3QOAwBlUwlYiHgmUArpPr9ALBGU1gmVEJUMn+T+/gypkTZyAZgCgUFEg2tEDQog9PKA7
	4/j1UOe5SG7MyfH0Za9pTgULHkXs8Cuffq1ejuurDEEBJ941bezlWMb9yRREeXfKEBiz1p32kmMPS
	5+b9JKVs/v+q7dULNCdA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0kxV-0002sC-BE; Thu, 22 Aug 2019 11:08:49 +0000
Received: from dc2-smtprelay2.synopsys.com ([198.182.61.142]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i0kxS-0002rN-UX
 for linux-i3c@lists.infradead.org; Thu, 22 Aug 2019 11:08:48 +0000
Received: from mailhost.synopsys.com (dc2-mailhost1.synopsys.com
 [10.12.135.161])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 42DDAC03C2;
 Thu, 22 Aug 2019 11:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1566472124; bh=LP7CVGGK1IS0ibpvIRZMhcsijCOqivHm4ucS1JXIHEI=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=iFRenLba8l2QK/nW4/9DEB+LH821NbdPWpxF37hPZm8ZPefD0eSpJHpNCR6zoXOMW
 OcJOFViGeq30OLW/rVPQre0VKWNqqXIR5wHfi/r0NJ2yurgQFL6exCmQ7prH5lr5FF
 jVi3TOiUXiBk9989/CgvQrgi5CwHHa44mvJ/uAUCgQGP2xXwyYq/gNEUt8BXmQJ/gt
 QbM22hJF12nfNNUgl4AUMUDUHGI7xH/2sI9QHxoqAM7Hbb4bcGAGGb43hXUR/CIQ8d
 WHOC2E1MJTo4jiPwcjse6qndJIW4id2nlbo+Hbe14BGtEaqF1zvQSKKyYkZg+j9vHi
 kcXVLen/TDjwA==
Received: from us01wehtc1.internal.synopsys.com
 (us01wehtc1-vip.internal.synopsys.com [10.12.239.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id BEFD8A0097;
 Thu, 22 Aug 2019 11:08:42 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 us01wehtc1.internal.synopsys.com (10.12.239.235) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 22 Aug 2019 04:08:42 -0700
Received: from NAM03-CO1-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Thu, 22 Aug 2019 04:08:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EyqqkEzg5/Xpc4tGnUwA+6CgQiE7mV7/S/gDjUTTXCt8csoj8DT+qkWkjjEr/XSdYpDmOo0/jPRoei2VxUT6qKq6fer/59jdOFLLbAzo0sbPuGnPrR+CHP+7VLrjYT2rIM3TNW2y59dMfuui6aJiZwHlaMoDk7ehfuGgmfYIoR0kBmY2Bw8l9WX60opuv7l3+cQINKNTKc3E5j1k3IzDhLeMeLmoqPmcldUJjTK3lcl0y4rtn+rhhWLqGfDbgk58d12oVyS1GbAHwTIHVJwQ8dXPfR4Twv/1w2PYKnTJJqKCBFpBc1x7mlmX3egpNc8TPJs0iLag7+5aY/YfRLkZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK8cAN6zZSBXzWuL6n8Rdgy8e++AYZFeNoVF3VHiWbw=;
 b=ZCxmksLiyMfhxK3ubk5WJkddMcaOmmzZvLDbHaDRL0UlT+CwkWbcAFbLRj0vl1UQW7uFJI3qjAPNtE4CRWAHrmhpa9naOei6m/hz4GmxxDa9LuXW6LGUNTKz8+YVc9MSBqPsB6pmRpmuiFAaHX5hXxvvX7BtFjWQllfBUz1zMiJArO+H7mM+uP631Y14xDqAoxXUgw4TtjnELK8QlxmITMCdtwT1bYhLXYcvXuPiZZmg/2IghzPT56xL7b2znctmYafdKTWVhHXIIE5hMrXDZW/bzpLoi1lu4qqPn8HNyo40TmWS/SLFBIqLXvbiQE9elZGA7d50Gx6eODACqBte0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lK8cAN6zZSBXzWuL6n8Rdgy8e++AYZFeNoVF3VHiWbw=;
 b=PQhXAjCKB5SxWlLJn6boTKdQoIlzLeZM5mc6egcBUV5hq2QXGHrabzXxb01Ag2uEUOfzyqi9LrvlNcvyj2uTmwSbqgfzxeaskTADiWcHdaAjGgmCk9LtCEoPG57yhnqpPHpL3GZVdMW6IP57rLXs/6zZwoTljyKTTuMuJdXZsWk=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2671.namprd12.prod.outlook.com (52.135.103.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.18; Thu, 22 Aug 2019 11:08:41 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6%4]) with mapi id 15.20.2178.020; Thu, 22 Aug 2019
 11:08:41 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHVKTzvS0luBz5Hrkq+/RgY+Ornt6bEKIMAgADX5wCAAEBC0IABoPuAgAAJhgCALx5ZAIABmX0wgABGfICAD3bfAA==
Date: Thu, 22 Aug 2019 11:08:41 +0000
Message-ID: <SN6PR12MB26551AEDEC830BE3A75859F3AEA50@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
 <SN6PR12MB2655AA801F30D1C237C18CFAAEF00@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190711052440.GA13386@global.cadence.com>
 <SN6PR12MB2655B1D9B6F0135E84FC6D0DAEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712101042.GA4728@global.cadence.com>
 <SN6PR12MB2655A1F005B691E4E98B282CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190811121738.71b55bb1@collabora.com>
 <SN6PR12MB26550DA8761E71DDAABED36FAED30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190812165531.28a38c78@collabora.com>
In-Reply-To: <20190812165531.28a38c78@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMzA4ODY1YzQtYzRjZC0xMWU5LTgyNTItYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDMwODg2NWM2LWM0Y2QtMTFlOS04MjUyLWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iMTgzMyIgdD0iMTMyMTA5NDU3MTgzMzQ1?=
 =?us-ascii?Q?MjA3IiBoPSJ4czJoN1lkeE9kWkhlSFRId3hJancwd2hjV289IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUEz?=
 =?us-ascii?Q?Q3VMeTJWalZBVlVza0w3aTdFeThWU3lRdnVMc1RMd09BQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBSEFBQUFDa0NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBUUFCQUFBQVZ6ZGhHZ0FBQUFBQUFBQUFBQUFBQUo0QUFBQm1BR2tBYmdC?=
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
x-ms-office365-filtering-correlation-id: 54f1869a-d7b1-492f-ec21-08d726f1170a
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600166)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:SN6PR12MB2671; 
x-ms-traffictypediagnostic: SN6PR12MB2671:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2671AFEA67468C295D54F833AEA50@SN6PR12MB2671.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6790;
x-forefront-prvs: 01371B902F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(346002)(376002)(366004)(136003)(396003)(39850400004)(199004)(189003)(6506007)(229853002)(316002)(8936002)(66066001)(66446008)(66556008)(9686003)(102836004)(33656002)(478600001)(14454004)(53936002)(55016002)(76116006)(52536014)(6246003)(66946007)(66476007)(6436002)(64756008)(6636002)(5660300002)(6116002)(71190400001)(446003)(86362001)(71200400001)(25786009)(256004)(14444005)(4326008)(305945005)(54906003)(476003)(7696005)(26005)(7736002)(74316002)(3846002)(8676002)(486006)(76176011)(99286004)(2906002)(11346002)(81166006)(81156014)(110136005)(186003);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2671;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 9yJJazc1uArSuJWy1qcKKOF4xiJXfy2L/XvGu27NZble82FJv3OWjobafum1tqhhpywdP4oYXB30SdjAdTv+uLDijXxFPsm+wMjQ7QB5Y/1SQvNBGZKzEWmKeBVS9M3+p5LhXeegHOlhxidBQ8+z1VprfhKPRDOduKbzzBkJbpdU2Fb2tqacn1ikj4nU7WcHumVx4mF7x7cdtVF5yNDJD5rJIABj2svJDI7Mtn76kYi/yR2iF7HjLsjBB28+GInik6JTcGVbc0ewHrpbEomWcpN1R9LImRkD/1CMarP64FbloPnS1U/2cdqRTgtRntXWSCOTrwZGY8mXVnS+3xhK8kXqmodhhDuKENU565vFNw+r+CtuNuMxTxNMWEoEZ9pgxJ5FQSlP2e5CKkCx8EbBPAm2ThFEp0CPuuo9tFH+8Gk=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 54f1869a-d7b1-492f-ec21-08d726f1170a
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Aug 2019 11:08:41.0450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zRXHkv3ltSLShzOLVuiSJQACN30YKrX0aTmxx+J/CHCcyaRfJdvqs2bq9Vmz8Wmlh5M+GM4huZ8FfXOHvYRLig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2671
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190822_040847_055561_D49EC17A 
X-CRM114-Status: GOOD (  18.60  )
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
 "agolec@cadence.com" <agolec@cadence.com>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Mon, Aug 12, 2019 at 15:55:31

> > > > > > > > 
> > > > > > > > It is not clear to me what you expect with these functions. Do you want 
> > > > > > > > to enable MR from all devices? Just some of them? How do you decide which 
> > > > > > > > secondary masters are allow earn the bus ownership?
> > > > > > > >     
> > > > > > > 
> > > > > > > We discussed this also. For now, we enable ENEC for all masters on the bus, we
> > > > > > > can change it later if needed.     
> > > > > > 
> > > > > > I would say to expand the current ibi framework to accommodate MR and    
> > > > > 
> > > > > Can you tell something more here? What benefits you see    
> > > > 
> > > > Just starting with the name. IBI stands for In Band Interrupt which can 
> > > > be MR, HJ or SIR.
> > > > 
> > > > Also the concept is the same, let say you are registering a SIR w/out 
> > > > data but in fact it is a MR.  
> > > 
> > > No, it's not from a SW PoV. IBI are events I3C device drivers can
> > > register a handler for, MR and HJ events are things the HC drivers are
> > > expected to handle, and that's a big difference. While re-using the IBI
> > > API to handle them should be doable I don't think it will make things
> > > simpler.
> > >   
> > 
> > In that case we need to rename the functions with slave interrupt request 
> > (SIR) in mind.
> 
> I'm fine changing ibi for sir. Can you send a patch doing that?
> 

I address this topic on MIPI forum and it is correct to assume IBI as SIR 
and not MR.
With this clarification is not necessary to change the 
functions/structures/variables names.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
