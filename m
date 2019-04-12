Return-Path: <SRS0=TOMy=SO=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AE94C10F0E
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Apr 2019 14:28:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4615A2084D
	for <linux-i3c@archiver.kernel.org>; Fri, 12 Apr 2019 14:28:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gZT4RM6W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="ifWIqsSx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4615A2084D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYDXMWCSFngAqT/Np7SvOmWIJq+jtEgelSzVEiI/OWM=; b=gZT4RM6W+klotD
	PDNETED9I182KnX/dZJr6O4Jd49HUUTNbCWq3DcQLYN4cOR5iK5GhNQnV4ziTa15szz4LUNl6mPkM
	9zu7f+SUP2G8hU3E9gxcPynDvKblMxaNBQWjiRBzxZ7HCDn8QvsrwRPFGPIQJF6e9X/v88OxYORsG
	FVxMxBy3VVbq88rzPfhXgYBItmQrok/2GFUBmodZ9ozxrLt4ash9Kg/+jnpv8jsTN2oXfnnE6La7P
	LU71kussCfRVLR5QyqfR8vii3OwWeDNJkOvw72d23QJheBgv7lf0wAMZuZWDjGtkjvKyQdywoflAa
	29ckORGIUenOyfuFNCOQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hExAS-0003Z2-RI; Fri, 12 Apr 2019 14:28:36 +0000
Received: from us01smtprelay-2.synopsys.com ([198.182.60.111]
 helo=smtprelay.synopsys.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hExAP-0003Yi-DK
 for linux-i3c@lists.infradead.org; Fri, 12 Apr 2019 14:28:35 +0000
Received: from mailhost.synopsys.com (dc8-mailhost1.synopsys.com
 [10.13.135.209])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay.synopsys.com (Postfix) with ESMTPS id 290E610C29ED;
 Fri, 12 Apr 2019 07:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1555079311; bh=Zhfz8kag1G8AG3sFlUkZX7od43cfK/kzW4Q6mxQmUNk=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=ifWIqsSxYfZ/VI9qwBEIOLMEp/s+c28fMLdXQIMxd7+JFMVyoo3mWW+b4UTgF8ag+
 ENqrT0Ykk+XiMKQH9DqgvBCaWBmq5zFIJkAeqVY3N9POgpofPjCLkbTC+LLQmZAmw4
 LMASDHGvz64mXbHknlijfXwPC6tcDnICEdRPVGdb7p+aPHWfHz2x0tnfQYVKs8YVKs
 qUBnLR/ZidEdXoaR93Sxxyghv+5XpJWBNUd65baSMaVp81vknJFS9TDtYMgNgcOjQC
 26LfymXOc9RD4Apo3f6WcYNG6VK80gXRCXpNsnl8bDRb5aN8rlaTbMCLOJ74NqumXP
 hX+1LLEKYfaAA==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id C94CFA006D;
 Fri, 12 Apr 2019 14:28:29 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Fri, 12 Apr 2019 07:28:29 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Fri, 12 Apr 2019 16:28:27 +0200
From: Vitor Soares <vitor.soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <vitor.soares@synopsys.com>
Subject: RE: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Topic: [PATCH v4 3/6] i3c: Add support for mastership request to I3C
 subsystem
Thread-Index: AQHU10l/l7Y/AuF2m06V4TWxPbYeTaYnpPuAgAw6WdCAACAaAIAAIjYggADigwCAAE2IsP//8JuAgANPWhA=
Date: Fri, 12 Apr 2019 14:28:26 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350A614581@DE02WEMBXB.internal.synopsys.com>
References: <20190310135843.21154-1-pgaj@cadence.com>
 <20190310135843.21154-4-pgaj@cadence.com>
 <06a6f65b-a397-27c9-fa4f-e2147080be12@synopsys.com>
 <13D59CF9CEBAF94592A12E8AE55501350A61307C@DE02WEMBXB.internal.synopsys.com>
 <20190409152028.GA8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6130A6@DE02WEMBXB.internal.synopsys.com>
 <20190410065339.GB8934@global.cadence.com>
 <13D59CF9CEBAF94592A12E8AE55501350A6131C9@DE02WEMBXB.internal.synopsys.com>
 <20190410123603.0ef10c19@collabora.com>
In-Reply-To: <20190410123603.0ef10c19@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctMzkyZGIyM2UtNWQyZi0xMWU5LTgyM2EtZDQ4MWQ3?=
 =?us-ascii?Q?ODUxODBmXGFtZS10ZXN0XDM5MmRiMjNmLTVkMmYtMTFlOS04MjNhLWQ0ODFk?=
 =?us-ascii?Q?Nzg1MTgwZmJvZHkudHh0IiBzej0iNzAxMyIgdD0iMTMxOTk1NTI5MDQ4NjM2?=
 =?us-ascii?Q?OTY3IiBoPSIyS0owMkpxSFlucnpBNHJVNWdhTG9xcDB1dzg9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUFu?=
 =?us-ascii?Q?UHVMOE8vSFVBUnlmUVBUbS9rdGdISjlBOU9iK1MyQU9BQUFBQUFBQUFBQUFB?=
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
x-originating-ip: [10.107.25.87]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190412_072833_466333_63743065 
X-CRM114-Status: GOOD (  36.65  )
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.21
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
 "bbrezillon@kernel.org" <bbrezillon@kernel.org>,
 "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "rafalc@cadence.com" <rafalc@cadence.com>,
 "agolec@cadence.com" <agolec@cadence.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Wed, Apr 10, 2019 at 11:36:03

> On Wed, 10 Apr 2019 10:05:33 +0000
> Vitor Soares <vitor.soares@synopsys.com> wrote:
> 
> 
> > > > > >   
> > > > > > > > @@ -2504,9 +2745,11 @@ int i3c_master_register(struct   
> > > > > i3c_master_controller   
> > > > > > > *master,  
> > > > > > > >  	 * register I3C devices dicovered during the initial DAA.
> > > > > > > >  	 */
> > > > > > > >  	master->init_done = true;
> > > > > > > > -	i3c_bus_normaluse_lock(&master->bus);
> > > > > > > > -	i3c_master_register_new_i3c_devs(master);
> > > > > > > > -	i3c_bus_normaluse_unlock(&master->bus);
> > > > > > > > +	i3c_master_register_new_devs(master);
> > > > > > > > +
> > > > > > > > +	i3c_bus_maintenance_lock(&master->bus);
> > > > > > > > +	i3c_master_enable_mr_events(master);  
> > > > > > 
> > > > > > Why are you enabling MR events here? As a standard function this might case   
> > > > > issues  
> > > > > > because the master can support ENEC/DISEC commands but not multi-master   
> > > > > typologies.
> > > > > 
> > > > > I enable it at the end of master registration to be sure that current master 
> > > > > is
> > > > > ready for bus mastership relinquish. If controller does not support secondary
> > > > > master role it can just do nothing with it.  
> > > > 
> > > > I think it isn't good idea to have this here because you are forcing HC driver to
> > > > verify it. If it is to be done in subsystem side probably it is better to have a
> > > > master/slave functionalities structure.  
> > > 
> > > If multi-master topology is not supported, request_mastership() hook won't be
> > > implemented and also you will not implement enable/disable_mr_events() hooks.
> > > You don't have to verify it in the driver.  
> > 
> > In that case we will need a driver for each role/set of available 
> > features and duplicate the code otherwise this need to be checked in HC 
> > side.
> 
> Not really, just 2 set of ops, one with the hooks set and another one
> with the hooks left unassigned (NULL). But I guess we can also add
> a caps field where we'd list i3c master caps (secondary master,
> supports MR, ...).

Yes we can do this, but what I see is to have several ops structures 
based on HC capabilities.

> 
> > 
> > >   
> > > >   
> > > > >   
> > > > > >   
> > > > > > > > +	i3c_bus_maintenance_unlock(&master->bus);
> > > > > > > >  
> > > > > > > >  	return 0;
> > > > > > > >  
> > > > > > > > @@ -2524,6 +2767,30 @@ int i3c_master_register(struct   
> > > > > i3c_master_controller   
> > > > > > > *master,  
> > > > > > > >  EXPORT_SYMBOL_GPL(i3c_master_register);
> > > > > > > >    
> > > > > > 
> > > > > > I'm thinking if isn't better to instantiate the bus apart and them register   
> > > > > the secondary master.
> > > > > 
> > > > > It looked like that before but we decided to register everything or nothing.  
> > > > 
> > > > I see your point, but for the future, slave implementation, we can have a
> > > > function to instantiate just the bus and another for master or slave.
> > > >   
> > > 
> > > We can go the same way with slave, and register bus and slave at once. If this
> > > is the case.  
> 
> The slave framework isn't there yet, and I don't think we should expose
> the bus concept to slave drivers anyway. If a master can act both as a
> slave (I mean a slave that can do more than just send MR requests)  and
> a master (secondary), the driver should register to both framework.
> 
> > 
> > What if the slave is a secondary master? In your opinion what should be 
> > the flow?
> 
> i3c_slave_regiter(&ctrl->slave);
> i3c_master_regiter(&ctrl->master);
> 
> The order is arbitrary, and those might actually be called from
> different path if it makes more sense. I'm just pointing out that
> registering a slave and registering a master are 2 different things,
> and the master side of the framework should probably not automate slave
> registration, at least not until we have a better idea of what the
> slave API will look like.

We need to understand better your point.

The secondary master can have both roles and even not implementing all 
slave function it is a slave when is not a master.
For me still keep the idea:

        bus
         / \
       /     \
slave    master

and just one role is active at time.

I didn't get why the bus shouldn't be instantiated for slave. Can you 
explain?

In any case we will need a common point to switch the roles.

> 
> > 
> > >   
> > > > >   
> > > > > > In this way you are able to add DEFSLVS even before the HC has enable MR   
> > > > > events like it is done  
> > > > > > with dt devices.  
> > > > > 
> > > > > I don't get it. What do you mean "add DEFSLVS"? DEFSLVS should be received 
> > > > > from
> > > > > current master right after ENTDAA. Could you please explain?  
> > > > 
> > > > So the current master receive an hot join and send the DEFSLVS, when do you
> > > > add them to the bus? Will you go for the all process to get all dev info and so on?
> > > >   
> > > 
> > > When current master receives an hot-join, do ENTDAA to enumerate device which
> > > joined the bus and then sends DEFSLVS. This data is stored in secondary master
> > > controller and if secondary master can request mastership, collects all
> > > required informations and adds the devices. It has to collect PID, DEFSLVS does
> > > not provide this information.  
> > 
> > I see now. You need to take care here because when the secondary master 
> > add the i3c_dev it might change the address.
> > This is one of the reasons I would prefer a dedicated function to add the 
> > DEFSLVS.
> 
> IIRC, Cadence IP is parsing DEFSLVS in HW, and the device table is
> automatically filled based on that. We should only add the DEFSLVS
> parsing helper once we start seeing a need for it (probably when adding
> secondary slave support since you seem to insist on this aspect :-)).

For me the subsystem should hold and handle all this information. Anyway, 
this information is received and needed before the mastership takeover.
Basically I want to avoid to put this type of logistics in HC driver 
layer and call the maintenance_lock.

I'm insisting because it seems that I have a different use case to 
address and I don't see how this fit on it.

> 
> > 
> > Another point is what happen if the current master received MR request 
> > during this registration?
> 
> You mean when registering the primary I3C master? The driver should
> take care of disabling MR interrupts and if possible reject all
> incoming MR. MR should only be re-enabled when ->enable_mr_events() is
> called by the core.

I'm aware of that I just didn't see any disable events.


Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
