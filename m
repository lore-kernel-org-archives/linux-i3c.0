Return-Path: <SRS0=wpU+=WI=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8615BC31E40
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Aug 2019 13:56:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CC8720684
	for <linux-i3c@archiver.kernel.org>; Mon, 12 Aug 2019 13:56:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="m//0xSR8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="P4Faidh5";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="IKjELj9I"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CC8720684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TCFozLxlSR6ekZWqPBelPNuuQXYULk0mYHHe4ONTiJY=; b=m//0xSR8P2Rg9m
	wn01ZjLwid+riKmkEQxU0VIb6Z/i5xpeheYf3OTU7RYpD6OQMGBZgy8eEh0kpi12az3AwZeUdiEzW
	xIA46+GvAD+zeadoqvQxzRn0qoLEnoBvG/6OHURpgvDqhhtIiRnxMLRGyqjG70dh3WZMaTMAH5hX9
	/Hu4nYRcQgEupQClF0H5GAdfckUV5VhtAYi86di3bvCZ/SveN15tzYlKeec4NDRv3r+sPWhUnQFzt
	HmjnF7GHgo24KKvEEdfpMG56yTvD1tqu0Rd2VJQ/fEYMemEmGkFesBXc+FPl4mDol/xCXim64XdV3
	KB1Bpy8Gd3a2AdAARFAQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hxAoa-0001CH-Ug; Mon, 12 Aug 2019 13:56:48 +0000
Received: from dc8-smtprelay2.synopsys.com ([198.182.47.102]
 helo=smtprelay-out1.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hxAoW-00018s-31
 for linux-i3c@lists.infradead.org; Mon, 12 Aug 2019 13:56:46 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id CCE50C21D8;
 Mon, 12 Aug 2019 13:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1565618202; bh=lW9GNHHEEuMMfjxgFeBxBDc7+FaoLqLt+9Ildt1k85w=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=P4Faidh5rUD5OnGURwHHPLI3CkZYtiF6UquRB/NfrM8zpvMdCcpDHffitD3OdSnVf
 Dl8g6qbPc7dlWvJzvQ8uqpcU5iLQPU4kS2219ErpTGhIDlEbl65ps7r3Pn4ZldAjOV
 1zjnxCXBsKQJqwhMFyPrw8JXTTT6Wrkas94Gy7BuTndfxfwyEEWVKW+J+Bjvbekajd
 MXdnmKbDNR/zEn+nqzJiQDVDL1L7VdMksgJnHjSNjyVGcLXhhiTfZyy3wI2eV86lCC
 BSF+2Ff8Vga9DvpmrBk5+0p8W/Ieio5Bee8uykqqKzefcSoBT0xmnkpOZAhN/Fx/71
 9+siBZSPKEN1Q==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 4BBE0A0095;
 Mon, 12 Aug 2019 13:56:41 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Mon, 12 Aug 2019 06:55:40 -0700
Received: from NAM05-BY2-obe.outbound.protection.outlook.com (10.13.134.195)
 by mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Mon, 12 Aug 2019 06:55:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RGHHyRBKXX48r/WyzM+j4lzjuB+RHP3wmefrOdgsUMSKKNMrkmm+TXKt8juYrnbKd7KE9TtPnnz+NQ1QRhFdVwEwKQb56166aAO9yCUXmrLTRRLVNcUwMf5n+3JDnsr9pGtg39PAiUXIEsCWNBqzVNrkB+tiahBITjsYmzeXCuMbutrwQvNGU4yWs+Yhym9bCfboAWNL1TojbW2gOzSzlCJNO3uCL7JwyI/nMqy3o2aG95RBvzlOssKCuJvDKK2deQAUKVxI6iYpQeuWyufaZcbxE4RJlR/+ZTEXdCLTYJStD50orhCtNwtExcswkYv2AUifCIctFpWXJ5M+NhmJnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PnPihh8mnYpN4eSLZ8BFcwrm08WBNbOEuQlfcIJz+k=;
 b=nmSIwe6LSbutoB+w5UHNCzm0VGYi8M3jj4FLDrN/tMkBXGWYTok0/60jDpj41pvoau04UYd2+Lmr+Y1jwgaXeguFcx6oBVfTnxAalXfrPcSFywsC4LKky2FUqCzKj2DrumkN0J01MBliYzg84k+yUNPzF1i+JNqdQ6LU/dj1XjWYYa3JYUn7i+hSbuSCbHddT/g+f/+RCrYugLz6QZgDsBvZCzrkqZ9/WA8hiFBoz9NenmRwOZzXpadl+8ZiOOepSgKe7P2x5SJtzQfkn7XddgDnwQhJCa2PjYSf4b1VevuR6vMTjX+6tsUZWhJF3fajcynMbW427gEgDFHMlClaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/PnPihh8mnYpN4eSLZ8BFcwrm08WBNbOEuQlfcIJz+k=;
 b=IKjELj9IrSdz9qydbS5zKw+q3sMJYeuJ06wgv5QmxFI6kt9lXkBaozeNXcxVNKqz1VcV+Xf1NIYs4edRBgCGbt0+VBlHzrNa5CMCIbmmB0myBUc8X+k6XjWGz/mzKufh4VizYtHqbw+i4+rqY8VuTfYS6dLOwGOBCAt1e0NJSlg=
Received: from SN6PR12MB2655.namprd12.prod.outlook.com (52.135.103.20) by
 SN6PR12MB2622.namprd12.prod.outlook.com (52.135.103.11) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.18; Mon, 12 Aug 2019 13:55:34 +0000
Received: from SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6]) by SN6PR12MB2655.namprd12.prod.outlook.com
 ([fe80::89a7:a50:147b:52c6%4]) with mapi id 15.20.2157.015; Mon, 12 Aug 2019
 13:55:34 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>, Przemyslaw Gaj <pgaj@cadence.com>
Subject: RE: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v5 4/7] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHVKTzvS0luBz5Hrkq+/RgY+Ornt6bEKIMAgADX5wCAAEBC0IABoPuAgAAJhgCALx5ZAIABmX0w
Date: Mon, 12 Aug 2019 13:55:34 +0000
Message-ID: <SN6PR12MB26550DA8761E71DDAABED36FAED30@SN6PR12MB2655.namprd12.prod.outlook.com>
References: <1561236905-8901-1-git-send-email-pgaj@cadence.com>
 <1561236905-8901-5-git-send-email-pgaj@cadence.com>
 <SN6PR12MB2655AA801F30D1C237C18CFAAEF00@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190711052440.GA13386@global.cadence.com>
 <SN6PR12MB2655B1D9B6F0135E84FC6D0DAEF30@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190712101042.GA4728@global.cadence.com>
 <SN6PR12MB2655A1F005B691E4E98B282CAEF20@SN6PR12MB2655.namprd12.prod.outlook.com>
 <20190811121738.71b55bb1@collabora.com>
In-Reply-To: <20190811121738.71b55bb1@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctZDRiMGZmMGUtYmQwOC0xMWU5LTgyNGYtZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XGQ0YjBmZjBmLWJkMDgtMTFlOS04MjRmLWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iMjcyNzgiIHQ9IjEzMjEwMDkxNzMyMDA5?=
 =?us-ascii?Q?MDMxNSIgaD0iYTNJMmhtOXI5elpybUxmVDViRzlFQmJyQm9jPSIgaWQ9IiIg?=
 =?us-ascii?Q?Ymw9IjAiIGJvPSIxIiBjaT0iY0FBQUFFUkhVMVJTUlVGTkNnVUFBQlFKQUFE?=
 =?us-ascii?Q?TEFsNmJGVkhWQVZ6aVFBTlE5b3BHWE9KQUExRDJpa1lPQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUhBQUFBQ2tDQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQVFBQkFBQUFWemRoR2dBQUFBQUFBQUFBQUFBQUFKNEFBQUJtQUdrQWJn?=
 =?us-ascii?Q?QmhBRzRBWXdCbEFGOEFjQUJzQUdFQWJnQnVBR2tBYmdCbkFGOEFkd0JoQUhR?=
 =?us-ascii?Q?QVpRQnlBRzBBWVFCeUFHc0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCbkFHWUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BWVFCdEFITUFkUUJ1QUdjQVh3QmpBRzhBYmdCbUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWN3QmhB?=
 =?us-ascii?Q?RzBBY3dCMUFHNEFad0JmQUhJQVpRQnpBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0J6QUcwQWFRQmpBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFaZ0J2QUhVQWJnQmtBSElBZVFCZkFIQUFZUUJ5QUhRQWJn?=
 =?us-ascii?Q?QmxBSElBY3dCZkFITUFkQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCbUFH?=
 =?us-ascii?Q?OEFkUUJ1QUdRQWNnQjVBRjhBY0FCaEFISUFkQUJ1QUdVQWNnQnpBRjhBZEFC?=
 =?us-ascii?Q?ekFHMEFZd0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhr?=
 =?us-ascii?Q?QVh3QndBR0VBY2dCMEFHNEFaUUJ5QUhNQVh3QjFBRzBBWXdBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQVp3QjBBSE1BWHdCd0FISUFid0JrQUhVQVl3QjBBRjhB?=
 =?us-ascii?Q?ZEFCeUFHRUFhUUJ1QUdrQWJnQm5BQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUdFQWJBQmxBSE1BWHdCaEFHTUFZd0J2QUhVQWJnQjBBRjhBY0FCc0FHRUFi?=
 =?us-ascii?Q?Z0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFITUFZUUJzQUdVQWN3QmZB?=
 =?us-ascii?Q?SEVBZFFCdkFIUUFaUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQ2VBQUFBY3dCdUFIQUFjd0JmQUd3QWFRQmpBR1VBYmdCekFH?=
 =?us-ascii?Q?VUFYd0IwQUdVQWNnQnRBRjhBTVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFB?=
 =?us-ascii?Q?QnpBRzRBY0FCekFGOEFiQUJwQUdNQVpRQnVBSE1BWlFCZkFIUUFaUUJ5QUcw?=
 =?us-ascii?Q?QVh3QnpBSFFBZFFCa0FHVUFiZ0IwQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUhZQVp3QmZBR3NBWlFC?=
 =?us-ascii?Q?NUFIY0Fid0J5QUdRQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFB?=
 =?us-ascii?Q?QUFBQUNBQUFBQUFBPSIvPjwvbWV0YT4=3D?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 427b32aa-29ad-49f0-120b-08d71f2cbf72
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(2017052603328)(7193020);
 SRVR:SN6PR12MB2622; 
x-ms-traffictypediagnostic: SN6PR12MB2622:|SN6PR12MB2622:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR12MB2622E077BB46DDC219E51A10AED30@SN6PR12MB2622.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 012792EC17
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(366004)(39850400004)(376002)(396003)(346002)(136003)(43544003)(189003)(199004)(229853002)(561944003)(7736002)(30864003)(86362001)(66066001)(305945005)(6436002)(5024004)(5660300002)(2906002)(55016002)(71200400001)(11346002)(33656002)(14444005)(256004)(446003)(186003)(99286004)(74316002)(476003)(9686003)(52536014)(486006)(53936002)(102836004)(6506007)(71190400001)(53946003)(6116002)(81156014)(8676002)(14454004)(81166006)(26005)(3846002)(76176011)(478600001)(7696005)(54906003)(8936002)(316002)(4326008)(66446008)(66946007)(66476007)(25786009)(76116006)(66556008)(64756008)(110136005)(6246003)(579004)(559001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:SN6PR12MB2622;
 H:SN6PR12MB2655.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: XLH6pgrTYhrqV63A4ge70w9xEvJ1+gvuV2nTG4GSJgoVd+InFwGG3G8mm9LjAFcRSJ1DsXLVoHU8E/JcMb9ziDYmWKQgfumgG/5ZyghwlO55Sf/+qzVlLypFNjavG/u7JkCTQiorYjOr3ptaoUUU+xokRBlPphw3BH25mlpdGKPdALuFlmpLVS5f24iFUv+pfJEdq9SwbrjC43oOJ9/ndrJz6TjsJSnBaxfD64RCJZurbz0U8Q4Vc6/kQjVxh/7Zs4T+aux1KBh5YPHNr/nUpxY05hr1q5Ny/AuFHAC2bkqCeVnZzTlk5U+gyL94NEMfLYy0E8kk4QGJkXSdukb/Z2/iSukDgVjndT5HiFzj9Sb1JYAUC7g4LdFCnl9RL1EbSlHpEyYdmcd2LZWtutr9NXzZYVImZEqjanzNyQ05G6Y=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 427b32aa-29ad-49f0-120b-08d71f2cbf72
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2019 13:55:34.4991 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: YbZxo5frKXNFD/omlq9hOqgYF5pQ8SOdxZY3/qtT0vys00pwc0mN171d6LvZHJX8CWKp/fwvKBQaCLbjMIy+IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2622
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190812_065644_201873_56758A13 
X-CRM114-Status: GOOD (  21.36  )
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Boris,

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Sun, Aug 11, 2019 at 11:17:38

> Hi Przemek, Vitor,
> 
> Sorry for the late reply.
> 
> On Fri, 12 Jul 2019 11:28:36 +0000
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > > > > > > ---
> > > > > > > 
> > > > > > > Main changes between v4 and v5:
> > > > > > > - Add function to test if master owns the bus
> > > > > > > - Add i3c_secondary_master_register() function
> > > > > > > - Add populate_bus() hook to populate the bus after mastership takeover  
> > > > > > 
> > > > > > For me this task is for the sub-system not the host controller.
> > > > > >   
> > > > > 
> > > > > I'm not sure where device information is stored in DW controller but in CDNS
> > > > > controller DEFSLVS frame is processed in the device and the only thing I got is
> > > > > information that DEFSLVS came in.   
> > > > 
> > > > When you receive this notification you can add the device to subsystem to 
> > > > be initialized later when get bus ownership.  
> > > 
> > > I added this hook mostly because we have to lock the bus during devices
> > > addition. If we pass DEFSLVS devices information to the system in some
> > > structure, we should be ok. We can lock the bus in the framework and register
> > > all the devices. But I still don't feel this is good solution, I'll have to
> > > do the job once again which HW did before  
> > 
> > Your HW just fill a table with the DEFSLVS data and you still have to 
> > access, retrieve the information and attached to the controller (same 
> > approach as DAA).
> > 
> > If all these management is passed to the subsystem it will be more easy 
> > to maintain and HC agonistic.
> > 
> > > 
> > > @Boris, what do you think about that?
> 
> If there's nothing HW specific in ->populate_bus(), then yes, it makes
> sense to have it done in the core based on information extracted from
> the DEFSLVS frame.
> 
> > >   
> > > >   
> > > > > I need to inform subsystem that there are new
> > > > > device (if any).
> > > > > I remember we talkad about that already, you have access to
> > > > > DEFSLVS information directly, correct?  
> > > > 
> > > > I can process it in the HC driver, but my point is that I want to rely it 
> > > > to the subsystem the bus population with the function already present.
> > > >   
> > > 
> > > So, do you want to pack those informations back to i3c_ccc_defslvs and pass to
> > > the subsystem?  
> > 
> > Not necessary. It can be passed addr, bcr, dcr and lvr. 
> > 
> > In the subsystem I think it should be a list of i3c_ccc_defslvs that 
> > holds DEFSLVS information.
> 
> Sorry, I don't get what you mean here. Why would we want a list of
> i3c_ccc_defslvs objects when i3c_ccc_defslvs already stores an
> array of devices. I guess you meant a list of struct i3c_ccc_dev_desc
> objects.

I'm using a list with i3c_ccc_dev_desc objects to hold the DEFSLVS. When 
secondary master to get the bus ownership I initialize those devices and 
after I clean the list.
IMO we should avoid initializing devices when having device drivers 
trying to talk with the bus.

> 
> > 
> > >   
> > > > >   
> > > > > > > - Rework device information retrieval to allow adding partialy discovered
> > > > > > > devices
> > > > > > > 
> > > > > > > Main changes between v3 and v4:
> > > > > > > - Add i3c_master_acquire_bus_ownership to acquire the bus
> > > > > > > - Refactored the code
> > > > > > > 
> > > > > > > Main changes between v2 and v3:
> > > > > > > - Add i3c_bus_downgrade_maintenance_lock() for downgrading the bus
> > > > > > > lock from maintenance to normal use
> > > > > > > - Add additional fields to i2c_dev_desc for DEFSLVS purpose (addr, lvr)
> > > > > > > - Add i3c_master_register_new_i2c_devs() function to register I2C devices
> > > > > > > - Reworked I2C devices registration on secondary master side
> > > > > > > 
> > > > > > > Changes in v2:
> > > > > > > - Add mastership disable event hook
> > > > > > > - Changed name of mastership enable event hook
> > > > > > > - Add function to test if master owns the bus
> > > > > > > - Removed op_mode
> > > > > > > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > > > > > > pass full i3c_device_info
> > > > > > > - Changed name of mastership enable event hook
> > > > > > > - Add function to test if master owns the bus
> > > > > > > - Removed op_mode
> > > > > > > - Changed parameter of i3c_master_get_accmst_locked, no need to
> > > > > > > pass full i3c_device_info
> > > > > > > - Removed redundant DEFSLVS command before GETACCMST
> > > > > > > - Add i3c_master_bus_takeover function. There is a need to lock
> > > > > > > the bus before adding devices and no matter of the controller
> > > > > > > devices have to be added after mastership takeover.
> > > > > > > - Add device registration during initialization on secondary master
> > > > > > > side. Devices received by DEFSLVS (if occured). If not, device
> > > > > > > initialization is deffered untill next mastership request.
> > > > > > > ---
> > > > > > >  drivers/i3c/device.c       |  26 ++
> > > > > > >  drivers/i3c/internals.h    |   4 +
> > > > > > >  drivers/i3c/master.c       | 588 ++++++++++++++++++++++++++++++++++++++-------
> > > > > > >  include/linux/i3c/master.h |  34 ++-
> > > > > > >  4 files changed, 563 insertions(+), 89 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
> > > > > > > index 69cc040..b60f637 100644
> > > > > > > --- a/drivers/i3c/device.c
> > > > > > > +++ b/drivers/i3c/device.c
> > > > > > > @@ -43,7 +43,13 @@ int i3c_device_do_priv_xfers(struct i3c_device *dev,
> > > > > > >  	}
> > > > > > >  
> > > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > > +	if (ret)
> > > > > > > +		goto err_unlock_bus;
> > > > > > > +
> > > > > > >  	ret = i3c_dev_do_priv_xfers_locked(dev->desc, xfers, nxfers);
> > > > > > > +
> > > > > > > +err_unlock_bus:
> > > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > > >  
> > > > > > >  	return ret;
> > > > > > > @@ -114,11 +120,17 @@ int i3c_device_enable_ibi(struct i3c_device *dev)
> > > > > > >  	int ret = -ENOENT;
> > > > > > >  
> > > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > > +	if (ret)
> > > > > > > +		goto err_unlock_bus;
> > > > > > > +
> > > > > > >  	if (dev->desc) {
> > > > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > > > >  		ret = i3c_dev_enable_ibi_locked(dev->desc);
> > > > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > > > >  	}
> > > > > > > +
> > > > > > > +err_unlock_bus:
> > > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > > >  
> > > > > > >  	return ret;
> > > > > > > @@ -145,11 +157,17 @@ int i3c_device_request_ibi(struct i3c_device *dev,
> > > > > > >  		return -EINVAL;
> > > > > > >  
> > > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > > +	if (ret)
> > > > > > > +		goto err_unlock_bus;
> > > > > > > +
> > > > > > >  	if (dev->desc) {
> > > > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > > > >  		ret = i3c_dev_request_ibi_locked(dev->desc, req);
> > > > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > > > >  	}
> > > > > > > +
> > > > > > > +err_unlock_bus:
> > > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > > >  
> > > > > > >  	return ret;
> > > > > > > @@ -166,12 +184,20 @@ EXPORT_SYMBOL_GPL(i3c_device_request_ibi);
> > > > > > >   */
> > > > > > >  void i3c_device_free_ibi(struct i3c_device *dev)
> > > > > > >  {
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > >  	i3c_bus_normaluse_lock(dev->bus);
> > > > > > > +	ret = i3c_master_acquire_bus_ownership(dev->desc->common.master);
> > > > > > > +	if (ret)
> > > > > > > +		goto err_unlock_bus;
> > > > > > > +
> > > > > > >  	if (dev->desc) {
> > > > > > >  		mutex_lock(&dev->desc->ibi_lock);
> > > > > > >  		i3c_dev_free_ibi_locked(dev->desc);
> > > > > > >  		mutex_unlock(&dev->desc->ibi_lock);
> > > > > > >  	}
> > > > > > > +
> > > > > > > +err_unlock_bus:
> > > > > > >  	i3c_bus_normaluse_unlock(dev->bus);
> > > > > > >  }
> > > > > > >  EXPORT_SYMBOL_GPL(i3c_device_free_ibi);
> > > > > > > diff --git a/drivers/i3c/internals.h b/drivers/i3c/internals.h
> > > > > > > index 86b7b44..cdfc5bf 100644
> > > > > > > --- a/drivers/i3c/internals.h
> > > > > > > +++ b/drivers/i3c/internals.h
> > > > > > > @@ -14,6 +14,10 @@ extern struct bus_type i3c_bus_type;
> > > > > > >  
> > > > > > >  void i3c_bus_normaluse_lock(struct i3c_bus *bus);
> > > > > > >  void i3c_bus_normaluse_unlock(struct i3c_bus *bus);
> > > > > > > +void i3c_bus_maintenance_lock(struct i3c_bus *bus);
> > > > > > > +void i3c_bus_maintenance_unlock(struct i3c_bus *bus);  
> > > > > > 
> > > > > > These function are static.
> > > > > >   
> > > > > 
> > > > > I forgot to revert that change to previous state.
> > > > >   
> > > > > > > +int i3c_master_acquire_bus_ownership(struct i3c_master_controller *master);
> > > > > > > +  
> > > > > > 
> > > > > > What do you think to pass this logic to master.c?
> > > > > >   
> > > > > 
> > > > > Isn't it there?  
> > > > 
> > > > I meant make it static and remove its call from device.c.
> 
> Can you be more specific? Where would you move the
> i3c_master_acquire_bus_ownership() call? Note that we already
> considered different options and the solution proposed here was the
> cleanest race-free one.

Did you consider to pass it to i3c_dev_do_priv_xfers_locked()?
Can you help me to understand the drawbacks?

> 
> > > >   
> > > > >   
> > > > > > >  
> > > > > > >  int i3c_dev_do_priv_xfers_locked(struct i3c_dev_desc *dev,
> > > > > > >  				 struct i3c_priv_xfer *xfers,
> > > > > > > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > > > > > > index cbace14..3b44e66 100644
> > > > > > > --- a/drivers/i3c/master.c
> > > > > > > +++ b/drivers/i3c/master.c
> > > > > > > @@ -93,6 +93,18 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
> > > > > > >  	up_read(&bus->lock);
> > > > > > >  }
> > > > > > >  
> > > > > > > +/*
> > > > > > > + * i3c_bus_downgrade_maintenance_lock - Downgrade the bus lock to normal
> > > > > > > + * operation
> > > > > > > + *
> > > > > > > + * Should be called when a maintenance operation is done and normal
> > > > > > > + * operation is planned. See i3c_bus_maintenance_lock() and
> > > > > > > + * i3c_bus_normaluse_lock() for more details.
> > > > > > > + */
> > > > > > > +static void i3c_bus_downgrade_maintenance_lock(struct i3c_bus *bus)
> > > > > > > +{
> > > > > > > +	downgrade_write(&bus->lock);
> > > > > > > +}
> > > > > > >  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> > > > > > >  {
> > > > > > >  	return container_of(dev, struct i3c_master_controller, dev);
> > > > > > > @@ -341,6 +353,22 @@ static int i3c_device_probe(struct device *dev)
> > > > > > >  	return driver->probe(i3cdev);
> > > > > > >  }
> > > > > > >  
> > > > > > > +static int
> > > > > > > +i3c_master_enable_mr_events_locked(struct i3c_master_controller *master)
> > > > > > > +{
> > > > > > > +	if (!master->ops->enable_mr_events)
> > > > > > > +		return -ENOTSUPP;
> > > > > > > +
> > > > > > > +	return master->ops->enable_mr_events(master);
> > > > > > > +}
> > > > > > > +
> > > > > > > +static void i3c_master_disable_mr_events(struct i3c_master_controller *master)
> > > > > > > +{
> > > > > > > +	if (!master->ops->disable_mr_events)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	master->ops->disable_mr_events(master);
> > > > > > > +}  
> > > > > > 
> > > > > > Add new line.
> > > > > > 
> > > > > > It is not clear to me what you expect with these functions. Do you want 
> > > > > > to enable MR from all devices? Just some of them? How do you decide which 
> > > > > > secondary masters are allow earn the bus ownership?
> > > > > >   
> > > > > 
> > > > > We discussed this also. For now, we enable ENEC for all masters on the bus, we
> > > > > can change it later if needed.   
> > > > 
> > > > I would say to expand the current ibi framework to accommodate MR and  
> > > 
> > > Can you tell something more here? What benefits you see  
> > 
> > Just starting with the name. IBI stands for In Band Interrupt which can 
> > be MR, HJ or SIR.
> > 
> > Also the concept is the same, let say you are registering a SIR w/out 
> > data but in fact it is a MR.
> 
> No, it's not from a SW PoV. IBI are events I3C device drivers can
> register a handler for, MR and HJ events are things the HC drivers are
> expected to handle, and that's a big difference. While re-using the IBI
> API to handle them should be doable I don't think it will make things
> simpler.
> 

In that case we need to rename the functions with slave interrupt request 
(SIR) in mind.

> > 
> > >   
> > > > also add platform entry to allow secondary masters on the bus.  
> > > 
> > > This is something we can consider, to select devices which can request
> > > mastership. But I don't see the problem adding that later also.  
> > 
> 
> Fully agree with that, that's still something we can consider
> restricting afterwards. Remember that I3C is still not widely deployed
> and we only have 2 controller drivers so far, so patching them should be
> fairly easy if we decide to change the interface.

I think is too premature have a secondary master implementation. For now, 
I would say this is only good for testing purposes.


> 
> > 
> > 
> > >   
> > > >   
> > > > > Also, priority level is encoded in slave address
> > > > > so current master will give the control to the master with lower address first.
> > > > > It shouldn't be a problem.  
> > > > 
> > > > You can have security issues and the devices on the bus might not be 
> > > > prepared to work in multi-master environment.  
> > > 
> > > I don't get it, can you explan what do you mean? Which devices might not be
> > > prapared to work in multi-master environment, slaves? Key feature of I3C is
> > > multi-master capability. Mastership request should also be transparent for pure
> > > slaves on the bus. Of course, secondary masters should work in multi-master
> > > configuration  
> > 
> > So you are probing the same hw device on two different systems. This mean 
> > that in system A you can have the configuration A and in system B the 
> > configuration B.
> > How will you deal with this?
> 
> That's certainly something we should take care of, by restoring
> previous device configs every time a bus handover happens. It will
> probably involve some kind of collaboration between the core and device
> drivers, because part of the configuration (everything that's set
> through private SDR transfers) is only known by device users. The core
> can take care of restoring IBIs config though.
> 
> 
> > > > > > > +/**
> > > > > > > + * i3c_master_bus_takeover() - register new I3C devices on bus takeover
> > > > > > > + * @master: master used to send frames on the bus
> > > > > > > + *
> > > > > > > + * This function is useful when devices were not added
> > > > > > > + * during initialization or when new device joined the bus
> > > > > > > + * which wasn't under our control.
> > > > > > > + */
> > > > > > > +void i3c_master_bus_takeover(struct i3c_master_controller *master)
> > > > > > > +{
> > > > > > > +	struct i3c_dev_desc *i3cdev, *i3ctmp;
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	master->want_to_acquire_bus = false;  
> > > > > > 
> > > > > > Can you explain the usage of this variable?
> > > > > >   
> > > > > 
> > > > > The idea of this was to let HC know that we want to acquire the bus after
> > > > > ENEC(MR) received in slave mode.  
> > > > 
> > > > With the logic that I proposed you don't need this. When received ENEC 
> > > > you will try to get the bus ownership if HC not fully initialized or have 
> > > > DEFSLVS to add, otherwise you don't need to get the bus ownership.  
> > > 
> > > In case devices on the bus are the same, I agree. But please consider the case
> > > when slave joins the bus (Hot-Join) and MR event is disabled for now, our
> > > secondary master receives DEFSLVS, we add that device to the subsystem but
> > > cannot request mastership yet. We need a flag to indicate that we should
> > > request mastership on next ENEC(MR). It doesn't make sense to request
> > > mastership every time when ENEC(MR) is received.  
> > 
> > At least I think you can give a mean for the flag name, otherwise it is 
> > not clear why sec master want bus ownership.
> 
> Well, I guess the idea was to use the same flag for any kind of
> deferred MR requests. Not sure the reason for this MR request is really
> important since the same set of actions will be done anyway. Do you have
> a use case where we need to know the reason of a MR? If that's the
> case, or if we want to know it for debug purpose, I'd recommend adding
> extra flags to express that while keeping the want_to_acquire_bus one.

In my case, I don't need such a flag.
For now, I do MR when having Sec. Master to initialize, DEFSLVS to add or 
clients wanting transfer data.

> 
> > 
> > >   
> > > >   
> > > > >   
> > > > > > > +
> > > > > > > +	if (!master->init_done)
> > > > > > > +		return;
> > > > > > > +
> > > > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > > > +	master->ops->populate_bus(master);
> > > > > > > +
> > > > > > > +	list_for_each_entry_safe(i3cdev, i3ctmp, &master->bus.devs.i3c,
> > > > > > > +				 common.node) {
> > > > > > > +		if (i3cdev->info.pid)
> > > > > > > +			continue;
> > > > > > > +
> > > > > > > +		ret = i3c_master_retrieve_info_and_reuse(master, i3cdev);
> > > > > > > +		if (ret) {
> > > > > > > +			if (i3cdev->dev && i3cdev->dev->desc)
> > > > > > > +				i3cdev->dev->desc = NULL;
> > > > > > > +
> > > > > > > +			i3c_master_detach_i3c_dev(i3cdev);
> > > > > > > +		}
> > > > > > > +	}
> > > > > > > +
> > > > > > > +	/*
> > > > > > > +	 * If current master finished bus initialization properly, we can
> > > > > > > +	 * enable Mastership event.
> > > > > > > +	 */
> > > > > > > +	ret = i3c_master_enable_mr_events_locked(master);
> > > > > > > +	if (ret)
> > > > > > > +		dev_warn(&master->dev, "ENEC(MR) failed (ret = %i)", ret);
> > > > > > > +
> > > > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > > > +
> > > > > > > +	i3c_master_register_new_devs(master);
> > > > > > > +}
> > > > > > > +EXPORT_SYMBOL_GPL(i3c_master_bus_takeover);
> > > > > > > +
> > > > > > >  /**
> > > > > > >   * i3c_master_init() - initializes all the structures required by I3C master
> > > > > > >   * @master: master used to send frames on the bus
> > > > > > > @@ -2417,9 +2712,6 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > > > >  	struct i2c_dev_boardinfo *i2cbi;
> > > > > > >  	int ret;
> > > > > > >  
> > > > > > > -	/* We do not support secondary masters yet. */
> > > > > > > -	if (secondary)
> > > > > > > -		return -ENOTSUPP;
> > > > > > >  
> > > > > > >  	ret = i3c_master_check_ops(ops);
> > > > > > >  	if (ret)
> > > > > > > @@ -2432,6 +2724,7 @@ int i3c_master_init(struct i3c_master_controller *master,
> > > > > > >  	master->dev.release = i3c_masterdev_release;
> > > > > > >  	master->ops = ops;
> > > > > > >  	master->secondary = secondary;
> > > > > > > +	master->want_to_acquire_bus = secondary;
> > > > > > >  	INIT_LIST_HEAD(&master->boardinfo.i2c);
> > > > > > >  	INIT_LIST_HEAD(&master->boardinfo.i3c);
> > > > > > >  
> > > > > > > @@ -2488,6 +2781,92 @@ void i3c_master_cleanup(struct i3c_master_controller *master)
> > > > > > >  EXPORT_SYMBOL_GPL(i3c_master_cleanup);
> > > > > > >  
> > > > > > >  /**
> > > > > > > + * i3c_secondary_master_register() - register an secondary I3C master
> > > > > > > + * @master: master used to send frames on the bus
> > > > > > > + * @info: master info, describes this device
> > > > > > > + *
> > > > > > > + * This function takes care of everything for you:
> > > > > > > + *
> > > > > > > + * - updates this master info
> > > > > > > + * - registers the I2C adapter
> > > > > > > + * - if possible, populates the bus with devices received by DEFSLVS
> > > > > > > + *   command
> > > > > > > + *
> > > > > > > + * Return: 0 in case of success, a negative error code otherwise.
> > > > > > > + */
> > > > > > > +int i3c_secondary_master_register(struct i3c_master_controller *master,
> > > > > > > +				  struct i3c_device_info *info)
> > > > > > > +{
> > > > > > > +	int ret;
> > > > > > > +
> > > > > > > +	ret = i3c_master_set_info(master, info, master->secondary);
> > > > > > > +	if (ret)
> > > > > > > +		return ret;
> > > > > > > +
> > > > > > > +	ret = master->ops->bus_init(master);
> > > > > > > +	if (ret)
> > > > > > > +		return ret;  
> > > > > > 
> > > > > > At this point you don't have enough information to do the bus 
> > > > > > initialization.
> > > > > >   
> > > > > 
> > > > > Actually, current ->bus_init() implementations (in CDNS and DW) does not
> > > > > initialize the bus. We are just setting the mode, configuring some init values
> > > > > in the registers and enabling the core. Maybe we should rename it?  
> > > > 
> > > > The name for me its ok. My point was that when you call 
> > > > i3c_secondary_master_register() in CDNS you don't have yet DEFSLVS 
> > > > information.  
> > > 
> > > It depends. When current master did not initialize the bus yet, this is true.
> > > But when master and the bus are already initialized, I have DEFSLVS. Different
> > > story is that devices aren't added to the subsystem yet. So what I have do in
> > > that case is to enable to let HC operate and populate the bus later (using  
> > > ->populate_bus() hook)  
> > 
> > Ahh I didn't see, you are calling it in two different places. Does it 
> > make sense?
> > 
> > It is more logical to do the secondary_master_register() after get the 
> > bus ownership (just need the first time), otherwise the HC is just a 
> > slave.
> 
> I think we've tried that approach, and I wasn't happy with the end
> result. Don't remember the exact reason, but it was something related
> to extra complexity related to init/registration steps in HC drivers.
> You can look at my previous reviews if you want more details.

I tested both cases and doing secondary_master_register() after get the 
bus ownership I was able to reuse more code.

> 
> > > > > > 
> > > > > > In generally I found this intrusive for the current eco system.
> > > > > > 
> > > > > > I propose the following:
> > > > > > 1 - Keep the function i3c_master_register() as is and go out before   
> > > > > 
> > > > > We had that version previously. We decided to split it.  
> > > > 
> > > > You just need to split the secondary master part from it. So you can go 
> > > > out before i3c_master_bus_init() and keep the same function.  
> > > 
> > > We discussed that with Boris and we decided to split this function in this
> > > version to make things clear.  
> > 
> > My proposal isn't to much different with the advantage that it not broke 
> > the existing code.
> 
> How do we break existing code? Can you please be more specific when you
> make such statements so we can fix the problems. And no, keeping kernel
> APIs/interfaces stable has never been our goal. Actually, it's quite the
> opposite: the I3C subsystem is new, and if we see some of the initial
> functions/interfaces/hooks do not apply well to some of the new
> features we want to support, we should fix them, instead of trying to
> workaround them.

I wasn't able to apply the patch directly and I based my comments on the 
tests that I made.
During the process I didn't feel the need to work around anything (on 
current API) to implement secondary master.

> 
> > 
> > >   
> > > > 
> > > > Them use i3c_secondary_master_register() when received DEFSLVS or ENEC 
> > > > MR.  
> > > 
> > > It is also possible that our controller received DA and DEFSLVS even before
> > > master registration. We should try to register that, this is something I'm
> > > testing in my scenarios.  
> > 
> > That shouldn't be a problem. You receive DA and them DEFSLVS.
> > 
> > Add DEFSLVS to the system and try to be current master.
> > 
> > If you get the ownership, do:
> > 	i3c_secondary_master_register()
> > 	retrieve defslvs info and add them to the system.
> 
> That's not so simple. You have cases where the DEFLSLVS CCC has been
> received before the driver was loaded. In that case you should call
> i3c_secondary_master_register() in the probe path. 

You don't need that. Just try to became the master, if not, wait for ENEC 
MR.
The process is the same in both cases.

> It's this extra
> complexity about when to call i3c_secondary_master_register() (and
> other init steps related to that) that I was complaining about with
> this approach.
> 
> > 
> > After this you will see everything in /sys/bus/i3c/devices
> > 
> > If you don't get the ownership, it is ok because HC is just a slave.
> > 
> > I would try to da all management task in subsystem.
> 
> Again, please be more specific in your proposals. It's easy to come up
> with some high-level suggestions like "you should be able to do it this
> way", but unless you've actually tried you can't tell if that's possible
> or cleaner. I wish you had taken part to the discussion when it started
> and had followed the evolution of the patch series, this way you'd
> realized that we tried some of the things you suggest here and decided
> to do it differently because the end result was not so great.
> 
> Regards,
> 
> Boris

The secondary master is probably the most advanced feature in I3C and 
since beginning I'm complaining that it just fit your use case.
Even now, I don't see clear how to fit slave API in this use case.
In beginning when we started this secondary master topic, I pointed out 
the i2c multi master approach and you the OTG from USB. So far I don't 
see neither approach being used and we trying to reinvent the wheel.

Anyway I will try to come-up with a RFC based on what you are currently 
working yet it is only for testing.
Maybe we can split secondary master feature in phases:
  - Sec Master initialization
  - Mastership request
  - Mastership deliver
  - Mastership handoff
  - Mastership takeover 
  - Register DEFSLVS
  - Restore SIR request from slaves
  - Handle I3C device driver clients transfers on sec master side

It will be easier to follow the patches.

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
