Return-Path: <SRS0=HGQP=4J=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E98C35656
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 11:51:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E172024650
	for <linux-i3c@archiver.kernel.org>; Fri, 21 Feb 2020 11:51:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aoVQ3jz2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="XxMaVqfr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=synopsys.onmicrosoft.com header.i=@synopsys.onmicrosoft.com header.b="VdEp+rgx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E172024650
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O7yFERz11sOuf+tZZ0bmILNWJeZ3RzXXdK+UPe+XzIg=; b=aoVQ3jz2wJuyNN
	od9b5kuF+pu81wl4XmtBoJl5o7O5zhHFilKf2lKamOxXQgqG6sRnbatwfAvjuSYpTphSnA+ijkAAg
	wgoVtneL4J7ouaSSd9RKGPHqp0j+uRU81L+7ocdTQ3u5EqsxP++axqr5KHBCKCf1mX9OnnZvqHkNt
	Y0XpvDV94XZggzFoKvMbJ4ZjQKBlppUFrsfIVltA403k/Cf4fSn4sGK2NdYpTwuQpBMoqjFQY27nG
	2GPiF0yNPCDHMhm9vE/Ql6N0oROGuDUCLiZwwQmNM436h+/LUjIzGdssrDjvcJY/zYBZ1y8DAmfZI
	TWoePW6sr/MEWy9qA0gA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j56po-0003OE-KP; Fri, 21 Feb 2020 11:51:08 +0000
Received: from smtprelay-out1.synopsys.com ([149.117.87.133])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j56pm-0003Mu-Gn
 for linux-i3c@lists.infradead.org; Fri, 21 Feb 2020 11:51:07 +0000
Received: from mailhost.synopsys.com (badc-mailhost1.synopsys.com
 [10.192.0.17])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 52AEBC0093;
 Fri, 21 Feb 2020 11:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1582285865; bh=iX0IbWkgWKSzRTe8jiP6K2Yc0udFXUFnlBuct9VDRgM=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=XxMaVqfrayf3++KXFRpUaxB2OMDBD/2pHUyKXm9EiTT88L2cbIvPpW8NNiik5+rBv
 ksNtVhisGUoigdlsk3FHX00tMSRdVw2wwrnofuFz2RuQ25VsvQeg99RG1dM6gp3290
 tcoglXjNIE1m6ZFysffWJKBULOVxjgI1+bm/3OX3RBVNHB9Uia6xDnKrNxkd5bohQF
 sGOyksfocGoL+OuKrtsprx7fX6ZXGBzydUjmFsMs2a16DtUFtNegQimdg+p++DWVZ4
 7n3ricnsDYSr4eKDur+8uksdQkMhlSCCGfwUIIHPSV6iMq3wbh9A/VfJ0SKn1caNVn
 27DtYiD0cfJcA==
Received: from US01WEHTC3.internal.synopsys.com
 (us01wehtc3.internal.synopsys.com [10.15.84.232])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id E6EE0A00AE;
 Fri, 21 Feb 2020 11:51:01 +0000 (UTC)
Received: from US01HYBRID2.internal.synopsys.com (10.15.246.24) by
 US01WEHTC3.internal.synopsys.com (10.15.84.232) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 21 Feb 2020 03:50:45 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (10.202.3.67) by
 mrs.synopsys.com (10.15.246.24) with Microsoft SMTP Server (TLS) id
 14.3.408.0; Fri, 21 Feb 2020 03:50:44 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/Acf55kQ+Uq5s1ah/A2kxwPbrqFHpyjcrGmP7IUAejW3/sycg+aYrvJF2YNCkPRaaw5hLCfiDsykBSaStD7pcWyGvz5JkfQ/JHluSO739W3LDewOklSjPXbmQtHngzBg+wEthVGELiE4PXr25V7ndVL5q7B0yb8K9rT11iJ+hnRvvxArYrQ8Cj5UAT6TfL1UEEMjIzKAdjvA9uzDJVoZAbb3lXpBuFau9r8ZtQ9WYA973p4DeUtauBgESup0r7r+1A2hLzXPYAA7eyCeKVVoJ/LdK5Nuj3EUzSzXvnWggUd6C8xFB+FTjTH8Mjoo2VVyOtB/dvSlZXX+B9/AFrBjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iX0IbWkgWKSzRTe8jiP6K2Yc0udFXUFnlBuct9VDRgM=;
 b=B8Qb1tDirc7PlHVlm6f0LoKNJrNgtZJ+I50QiZjWfg7mgflp5c8W1lDU4zW8mpPJk5K83TXS0GWd1ob+3pK0CpbG4x4pVsln/4APpWaYWnk6pYUP5PK0w3sH+nbSv0b8G3+NEvEOTcB/Eg7MqmdRk+DYGy63vK5OPvHqn1OJhKSkTdRn/wPcf7sEtq6+XhjZzudxhJUJYo+6DrWEiYVjeJ7jh66pD2+bERwVuHSlt0DTDyINR/OoAVaEfim4pD2ZI7+9AzVGMh33W8nhmFSjUkFe7pW1hlqZ3LpCO/oRo6zEf5lleGKFDidPjtPplqwnyQG8g2xKu0SRyq5FhMhUVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.onmicrosoft.com; s=selector2-synopsys-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iX0IbWkgWKSzRTe8jiP6K2Yc0udFXUFnlBuct9VDRgM=;
 b=VdEp+rgxNMgt+mv0Y7ABtRBLC2CspbZ94mUkooJV/e3nh91SfPQ4y54ZzSyjgPOl3NkEhmylkD/zgUM/2I4PpQLAxqbHb+7vzVkF+blakITI0/NguW1HEu12/uGFtDG6CrB3vnsDfC1efTETTvCeur2EQ2qtUKvm2B5kCLjG42I=
Received: from CH2PR12MB4216.namprd12.prod.outlook.com (2603:10b6:610:a8::23)
 by CH2PR12MB3701.namprd12.prod.outlook.com (2603:10b6:610:23::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2750.17; Fri, 21 Feb
 2020 11:50:43 +0000
Received: from CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe]) by CH2PR12MB4216.namprd12.prod.outlook.com
 ([fe80::c8d1:bea7:c855:bcfe%5]) with mapi id 15.20.2729.033; Fri, 21 Feb 2020
 11:50:43 +0000
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: RE: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Thread-Topic: [PATCH v3 4/5] i3c: add i3cdev module to expose i3c dev in /dev
Thread-Index: AQHV5rqGCzs/XZoBrU+kjYi0pz6mk6giIdiAgANqbLA=
Date: Fri, 21 Feb 2020 11:50:42 +0000
Message-ID: <CH2PR12MB4216BFDAAD3EC267136856D7AE120@CH2PR12MB4216.namprd12.prod.outlook.com>
References: <cover.1582069402.git.vitor.soares@synopsys.com>
 <e093ae9da81e7702c188a20d1e8b9d7f8024bfeb.1582069402.git.vitor.soares@synopsys.com>
 <20200219073901.GC2728338@kroah.com>
In-Reply-To: <20200219073901.GC2728338@kroah.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctNjFiNDhmMDUtNTRhMC0xMWVhLTgyOGUtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XDYxYjQ4ZjA3LTU0YTAtMTFlYS04MjhlLWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iNDEzIiB0PSIxMzIyNjc1OTQ0MDkxMTQx?=
 =?us-ascii?Q?MzQiIGg9ImtjbXFpUm85M2l0WW55TGUrQzlJTFNuZVRKYz0iIGlkPSIiIGJs?=
 =?us-ascii?Q?PSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUJRSkFBQVcr?=
 =?us-ascii?Q?Z3drcmVqVkFYbWk1Tld1NG14RmVhTGsxYTdpYkVVT0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFIQUFBQUNrQ0FBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFF?=
 =?us-ascii?Q?QUFRQUJBQUFBc1BwUkdRQUFBQUFBQUFBQUFBQUFBSjRBQUFCbUFHa0FiZ0Jo?=
 =?us-ascii?Q?QUc0QVl3QmxBRjhBY0FCc0FHRUFiZ0J1QUdrQWJnQm5BRjhBZHdCaEFIUUFa?=
 =?us-ascii?Q?UUJ5QUcwQVlRQnlBR3NBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUVB?=
 =?us-ascii?Q?QUFBQUFBQUFBZ0FBQUFBQW5nQUFBR1lBYndCMUFHNEFaQUJ5QUhrQVh3QndB?=
 =?us-ascii?Q?R0VBY2dCMEFHNEFaUUJ5QUhNQVh3Qm5BR1lBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FBQUFB?=
 =?us-ascii?Q?QUNlQUFBQVpnQnZBSFVBYmdCa0FISUFlUUJmQUhBQVlRQnlBSFFBYmdCbEFI?=
 =?us-ascii?Q?SUFjd0JmQUhNQVlRQnRBSE1BZFFCdUFHY0FYd0JqQUc4QWJnQm1BQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJtQUc4QWRR?=
 =?us-ascii?Q?QnVBR1FBY2dCNUFGOEFjQUJoQUhJQWRBQnVBR1VBY2dCekFGOEFjd0JoQUcw?=
 =?us-ascii?Q?QWN3QjFBRzRBWndCZkFISUFaUUJ6QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?RUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFHWUFid0IxQUc0QVpBQnlBSGtBWHdC?=
 =?us-ascii?Q?d0FHRUFjZ0IwQUc0QVpRQnlBSE1BWHdCekFHMEFhUUJqQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFBQUFDQUFB?=
 =?us-ascii?Q?QUFBQ2VBQUFBWmdCdkFIVUFiZ0JrQUhJQWVRQmZBSEFBWVFCeUFIUUFiZ0Js?=
 =?us-ascii?Q?QUhJQWN3QmZBSE1BZEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUJBQUFBQUFBQUFBSUFBQUFBQUo0QUFBQm1BRzhB?=
 =?us-ascii?Q?ZFFCdUFHUUFjZ0I1QUY4QWNBQmhBSElBZEFCdUFHVUFjZ0J6QUY4QWRBQnpB?=
 =?us-ascii?Q?RzBBWXdBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFBQUFBQUFBQWdBQUFBQUFuZ0FBQUdZQWJ3QjFBRzRBWkFCeUFIa0FY?=
 =?us-ascii?Q?d0J3QUdFQWNnQjBBRzRBWlFCeUFITUFYd0IxQUcwQVl3QUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBUUFBQUFBQUFBQUNB?=
 =?us-ascii?Q?QUFBQUFDZUFBQUFad0IwQUhNQVh3QndBSElBYndCa0FIVUFZd0IwQUY4QWRB?=
 =?us-ascii?Q?QnlBR0VBYVFCdUFHa0FiZ0JuQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQkFBQUFBQUFBQUFJQUFBQUFBSjRBQUFCekFH?=
 =?us-ascii?Q?RUFiQUJsQUhNQVh3QmhBR01BWXdCdkFIVUFiZ0IwQUY4QWNBQnNBR0VBYmdB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBSE1BWVFCc0FHVUFjd0JmQUhF?=
 =?us-ascii?Q?QWRRQnZBSFFBWlFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFB?=
 =?us-ascii?Q?Q0FBQUFBQUNlQUFBQWN3QnVBSEFBY3dCZkFHd0FhUUJqQUdVQWJnQnpBR1VB?=
 =?us-ascii?Q?WHdCMEFHVUFjZ0J0QUY4QU1RQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFKNEFBQUJ6?=
 =?us-ascii?Q?QUc0QWNBQnpBRjhBYkFCcEFHTUFaUUJ1QUhNQVpRQmZBSFFBWlFCeUFHMEFY?=
 =?us-ascii?Q?d0J6QUhRQWRRQmtBR1VBYmdCMEFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBRUFBQUFBQUFBQUFnQUFBQUFBbmdBQUFIWUFad0JmQUdzQVpRQjVB?=
 =?us-ascii?Q?SGNBYndCeUFHUUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQVFBQUFBQUFB?=
 =?us-ascii?Q?QUFDQUFBQUFBQT0iLz48L21ldGE+?=
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=soares@synopsys.com; 
x-originating-ip: [83.174.63.141]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: e8a4a012-61ae-4f3f-c61a-08d7b6c447d4
x-ms-traffictypediagnostic: CH2PR12MB3701:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <CH2PR12MB37018E2939C9CB0463CFC018AE120@CH2PR12MB3701.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:214;
x-forefront-prvs: 0320B28BE1
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(396003)(136003)(39860400002)(346002)(376002)(366004)(199004)(189003)(71200400001)(9686003)(186003)(5660300002)(558084003)(2906002)(7696005)(4326008)(52536014)(76116006)(66946007)(6506007)(316002)(54906003)(26005)(64756008)(66446008)(81166006)(6916009)(81156014)(8676002)(86362001)(66556008)(478600001)(66476007)(8936002)(55016002)(33656002)(42413003)(32563001);
 DIR:OUT; SFP:1102; SCL:1; SRVR:CH2PR12MB3701;
 H:CH2PR12MB4216.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: synopsys.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xga/I6zPIBv5W4sL/awKLPynS/awxCyRAcCmmrtsLJljz0v9QxfX/pVx3kfEUq4nz1wXlMf4zn+/MfGt4lzmCNbv2Pdq8+Fl3QRB4c2MxLLpvSoEDghFbYaRXYvdfWiktoknrzp4OlAUnQAsIKmnqx2pGAXM4umABSnYxIl4BtGZoyaCHlsoCKMLQum8YRLoqbDmxFbIvmnJCtqdeIaJIhUtufFYKl2IWDhHyHgI89vFVZkZlGFv1tqJZewaiKVPhPtvWJISjOrMx0SfPaMJQiXVZn7JD+chXGkblqnOXcRcsi2D59jd22QRHQxeMw21DNDO1lk5XX5GoJU4tYPYQL2DyxQlQoDbYmbRF0E18d32vFg7sVpZS/SsjNGDhd4+dz6msqzSMbGRZ+FZe1WEXiCsDurTQGSQP0KlKqCyIcKvHCtmTDVd4cn0GmuKqnpdshnW8ohiq0H8G+r1WQvPoCRpiSve9E0N60GOcAaQBwquh42hvWtPzY9LeAmJvz0LzRZi2gPPF0kcf0zQngP3Sg==
x-ms-exchange-antispam-messagedata: dWM1MZBDFKNdNwDOYdSiz+MA2OA1RZY/WGWfVXMHImyYtHJLgokYbHDhCxuafI0O1edJCsJih5p7tBKE9DG/fR+oeeH7+00PG29lbQGi29ZjgaMDLa2t0wIRb+yAiDfKUpA9hf3mMtfDhm3Gatn5ug==
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: e8a4a012-61ae-4f3f-c61a-08d7b6c447d4
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Feb 2020 11:50:42.9523 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WM72mt1aTErvxfRd6AZZSK2r5dWbQJqm+YZgZ7kQQaAYTsJLTSHYSLA9cP+kNEi7/xQFfsowFCTdnOORRkGIhw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB3701
X-OriginatorOrg: synopsys.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200221_035106_621653_6923F093 
X-CRM114-Status: UNSURE (   9.23  )
X-CRM114-Notice: Please train this message.
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
Cc: Jose Abreu <Jose.Abreu@synopsys.com>, "corbet@lwn.net" <corbet@lwn.net>,
 Joao Pinto <Joao.Pinto@synopsys.com>, "arnd@arndb.de" <arnd@arndb.de>,
 "wsa@the-dreams.de" <wsa@the-dreams.de>,
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Greg KH <gregkh@linuxfoundation.org>
Date: Wed, Feb 19, 2020 at 07:39:01

> On Wed, Feb 19, 2020 at 01:20:42AM +0100, Vitor Soares wrote:
> > +
> > +static DEFINE_IDA(i3cdev_ida);
> 
> You never destroy this when the code is unloaded :(

You are right, I need to destroy it.

Thanks,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
