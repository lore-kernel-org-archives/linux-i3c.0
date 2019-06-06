Return-Path: <SRS0=CE6j=UF=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DB64C04AB5
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 17:18:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 186202083E
	for <linux-i3c@archiver.kernel.org>; Thu,  6 Jun 2019 17:18:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J5AaVoCk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=synopsys.com header.i=@synopsys.com header.b="V38AfP2x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 186202083E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=synopsys.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CvIperGjQc6MXSVFAMD9pPdHgj73SqHNFK7Cv/4PdUs=; b=J5AaVoCkBD0vh5
	tUhnfNlGEPQTpYu1vOEH9aYi0ezXpKpHrZmI/b4u3H0ZaTcGu3acGey7qxyv9HYNn+36Mb1jhgzfJ
	prnHR3qAaWKpdEHlBSPwYQ0K+hNYHBlcPWCkK43np0c5OcXYvj9bxRW27JWud/11495JtjHjb6ISu
	XUFp1Q11ibPTMDA9ElKM3Rn1PKUO7qehuXGOCdY87kONH03Ax/jUX/tAF7QAlzVlalzGfYTveHyrm
	yoAAJefK1y8F9F9kEHEEa9uKGTVeunZ1PkZC4oXF+8RL1VJSnKSIcjCnxxcNb9sC8tDgYWbUmoRQg
	s2GWNvMhsAJ0Nnf5HPNQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hYw1d-0006na-K6; Thu, 06 Jun 2019 17:18:05 +0000
Received: from smtprelay-out1.synopsys.com ([198.182.47.102])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hYw1a-0006mT-FG
 for linux-i3c@lists.infradead.org; Thu, 06 Jun 2019 17:18:04 +0000
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
 [10.12.135.162])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 97E87C0B52;
 Thu,  6 Jun 2019 17:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
 t=1559841492; bh=SKUWBfmcZwHcJJysdCCUSp18SgeyHGCkrPy4Igt1I60=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=V38AfP2xLj41xSeVhhcr0oSPabO18l4YzMO4DUcHvW39Ktbpi/xjT1g3ddFkP2IWI
 wzlk4o+Fjpm7R7QytBpf1NOlnQW/dllIe6iGPb3i368FWTj/SOhwIQL6jfxDTOdQwf
 1lOM0DpNp1Rl44v2pNsLySV61nbw4H3KSv/CaCA1UWin6NxUlTr2TfPGHKuBrkG7Zg
 xh4TvRV7bgsSOuLdCbVitg4mrDtmqkdS8J4m3jkswPeLMU1rd7auu8bwNouULpZZeU
 L+Coje5tTHKXZ6JSyfpktbplU8pMV6TGdblmrKKwoJqSrlu+y1a3qV8Vx41ovIqDGH
 NQfbp6ZXDsjhA==
Received: from US01WXQAHTC1.internal.synopsys.com
 (us01wxqahtc1.internal.synopsys.com [10.12.238.230])
 (using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mailhost.synopsys.com (Postfix) with ESMTPS id 7676FA0093;
 Thu,  6 Jun 2019 17:17:54 +0000 (UTC)
Received: from DE02WEHTCB.internal.synopsys.com (10.225.19.94) by
 US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP Server
 (TLS) id 14.3.408.0; Thu, 6 Jun 2019 10:16:58 -0700
Received: from DE02WEMBXB.internal.synopsys.com ([fe80::95ce:118a:8321:a099])
 by DE02WEHTCB.internal.synopsys.com ([::1]) with mapi id
 14.03.0415.000; Thu, 6 Jun 2019 19:16:56 +0200
From: Vitor Soares <Vitor.Soares@synopsys.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Vitor Soares <Vitor.Soares@synopsys.com>
Subject: RE: [PATCH v2 1/3] i3c: fix i2c and i3c scl rate by bus mode
Thread-Topic: [PATCH v2 1/3] i3c: fix i2c and i3c scl rate by bus mode
Thread-Index: AQHVHGF3lXrsgZbBP0uzVGVfPAtbX6aOizQAgABOUdA=
Date: Thu, 6 Jun 2019 17:16:55 +0000
Message-ID: <13D59CF9CEBAF94592A12E8AE55501350AABE7FC@DE02WEMBXB.internal.synopsys.com>
References: <cover.1559821227.git.vitor.soares@synopsys.com>
 <47de89f2335930df0ed6903be9afe6de4f46e503.1559821228.git.vitor.soares@synopsys.com>
 <20190606161844.4a6b759c@collabora.com>
In-Reply-To: <20190606161844.4a6b759c@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcc29hcmVzXGFw?=
 =?us-ascii?Q?cGRhdGFccm9hbWluZ1wwOWQ4NDliNi0zMmQzLTRhNDAtODVlZS02Yjg0YmEy?=
 =?us-ascii?Q?OWUzNWJcbXNnc1xtc2ctZTA0YjkzMzctODg3ZS0xMWU5LTgyNDYtYjgwOGNm?=
 =?us-ascii?Q?NTlkN2ZjXGFtZS10ZXN0XGUwNGI5MzM4LTg4N2UtMTFlOS04MjQ2LWI4MDhj?=
 =?us-ascii?Q?ZjU5ZDdmY2JvZHkudHh0IiBzej0iNjEzNiIgdD0iMTMyMDQzMTUwMTQ1ODQ4?=
 =?us-ascii?Q?NDA0IiBoPSJtWllrNkJsZ1BWTVJQdCtGYWpsS0VRVDQ3TGM9IiBpZD0iIiBi?=
 =?us-ascii?Q?bD0iMCIgYm89IjEiIGNpPSJjQUFBQUVSSFUxUlNSVUZOQ2dVQUFCUUpBQUJV?=
 =?us-ascii?Q?aEhlaml4elZBYWl3MG5yRCtlUkpxTERTZXNQNTVFa09BQUFBQUFBQUFBQUFB?=
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
x-originating-ip: [10.107.19.103]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190606_101803_057255_8395DDD2 
X-CRM114-Status: GOOD (  23.55  )
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
Cc: "linux-i3c@lists.infradead.org" <linux-i3c@lists.infradead.org>,
 "Joao.Pinto@synopsys.com" <Joao.Pinto@synopsys.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>,
 Boris Brezillon <bbrezillon@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

From: Boris Brezillon <boris.brezillon@collabora.com>
Date: Thu, Jun 06, 2019 at 15:18:44

> On Thu,  6 Jun 2019 16:00:01 +0200
> Vitor Soares <Vitor.Soares@synopsys.com> wrote:
> 
> > Currently the I3C framework limits SCL frequency to FM speed when
> > dealing with a mixed slow bus, even if all I2C devices are FM+ capable.
> > 
> > The core was also not accounting for I3C speed limitations when
> > operating in mixed slow mode and was erroneously using FM+ speed as the
> > max I2C speed when operating in mixed fast mode.
> > 
> > Fixes: 3a379bbcea0a ("i3c: Add core I3C infrastructure")
> > Signed-off-by: Vitor Soares <vitor.soares@synopsys.com>
> > Cc: Boris Brezillon <bbrezillon@kernel.org>
> > Cc: <stable@vger.kernel.org>
> > Cc: <linux-kernel@vger.kernel.org>
> > ---
> > Changes in v2:
> >   Enhance commit message
> >   Add dev_warn() in case user-defined i2c rate doesn't match LVR constraint
> >   Add dev_warn() in case user-defined i3c rate lower than i2c rate.
> > 
> >  drivers/i3c/master.c | 61 +++++++++++++++++++++++++++++++++++++++++-----------
> >  1 file changed, 48 insertions(+), 13 deletions(-)
> > 
> > diff --git a/drivers/i3c/master.c b/drivers/i3c/master.c
> > index 5f4bd52..8cd5824 100644
> > --- a/drivers/i3c/master.c
> > +++ b/drivers/i3c/master.c
> > @@ -91,6 +91,12 @@ void i3c_bus_normaluse_unlock(struct i3c_bus *bus)
> >  	up_read(&bus->lock);
> >  }
> >  
> > +static struct i3c_master_controller *
> > +i3c_bus_to_i3c_master(struct i3c_bus *i3cbus)
> > +{
> > +	return container_of(i3cbus, struct i3c_master_controller, bus);
> > +}
> > +
> >  static struct i3c_master_controller *dev_to_i3cmaster(struct device *dev)
> >  {
> >  	return container_of(dev, struct i3c_master_controller, dev);
> > @@ -565,20 +571,48 @@ static const struct device_type i3c_masterdev_type = {
> >  	.groups	= i3c_masterdev_groups,
> >  };
> >  
> > -int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode)
> > +int i3c_bus_set_mode(struct i3c_bus *i3cbus, enum i3c_bus_mode mode,
> > +		     unsigned long max_i2c_scl_rate)
> >  {
> > -	i3cbus->mode = mode;
> >  
> > -	if (!i3cbus->scl_rate.i3c)
> > -		i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > +	struct i3c_master_controller *master = i3c_bus_to_i3c_master(i3cbus);
> >  
> > -	if (!i3cbus->scl_rate.i2c) {
> > -		if (i3cbus->mode == I3C_BUS_MODE_MIXED_SLOW)
> > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> > -		else
> > -			i3cbus->scl_rate.i2c = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> > +	i3cbus->mode = mode;
> > +
> > +	switch (i3cbus->mode) {
> > +	case I3C_BUS_MODE_PURE:
> > +		if (!i3cbus->scl_rate.i3c)
> > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > +		break;
> > +	case I3C_BUS_MODE_MIXED_FAST:
> > +		if (!i3cbus->scl_rate.i3c)
> > +			i3cbus->scl_rate.i3c = I3C_BUS_TYP_I3C_SCL_RATE;
> > +		if (!i3cbus->scl_rate.i2c)
> > +			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
> > +		break;
> > +	case I3C_BUS_MODE_MIXED_SLOW:
> > +		if (!i3cbus->scl_rate.i2c)
> > +			i3cbus->scl_rate.i2c = max_i2c_scl_rate;
> > +		if (!i3cbus->scl_rate.i3c ||
> > +		    i3cbus->scl_rate.i3c > i3cbus->scl_rate.i2c)
> > +			i3cbus->scl_rate.i3c = i3cbus->scl_rate.i2c;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> >  	}
> >  
> > +	if (i3cbus->scl_rate.i3c < i3cbus->scl_rate.i2c)
> > +		dev_warn(&master->dev,
> > +			 "i3c-scl-hz=%ld lower than i2c-scl-hz=%ld\n",
> > +			 i3cbus->scl_rate.i3c, i3cbus->scl_rate.i2c);
> > +
> > +	if (i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_SCL_RATE &&
> > +	    i3cbus->scl_rate.i2c != I3C_BUS_I2C_FM_PLUS_SCL_RATE &&
> > +	    i3cbus->mode != I3C_BUS_MODE_PURE)
> 
> If you are so strict, there's clearly no point exposing an i2c-scl-hz
> property. I'm still not convinced having an i2c rate that's slower than
> what the I2C/I3C spec defines as the *typical* rate is a bad thing, 

I'm not been strictive, I just inform the user about that case.

> just
> like I'm not convinced having an I3C rate that's slower than the I2C
> one is a problem (it's definitely a weird situation, but there's nothing
> preventing that in the spec).

You agree that there is no point for case where i3c rate < i2c rate yet 
you are not convinced.
Do you thing that will be users for this case?

Anyway, this isn't a high requirement for me. The all point of this patch 
is to introduce the limited bus configuration.

> 
> > +		dev_warn(&master->dev,
> > +			 "i2c-scl-hz=%ld not defined according MIPI I3C spec\n"
> > +			 , i3cbus->scl_rate.i2c);
> 
> The comma should be on the previous line.
> 
> > +
> >  	/*
> >  	 * I3C/I2C frequency may have been overridden, check that user-provided
> >  	 * values are not exceeding max possible frequency.
> > @@ -1966,9 +2000,6 @@ of_i3c_master_add_i2c_boardinfo(struct i3c_master_controller *master,
> >  	/* LVR is encoded in reg[2]. */
> >  	boardinfo->lvr = reg[2];
> >  
> > -	if (boardinfo->lvr & I3C_LVR_I2C_FM_MODE)
> > -		master->bus.scl_rate.i2c = I3C_BUS_I2C_FM_SCL_RATE;
> > -
> >  	list_add_tail(&boardinfo->node, &master->boardinfo.i2c);
> >  	of_node_get(node);
> >  
> > @@ -2417,6 +2448,7 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  			const struct i3c_master_controller_ops *ops,
> >  			bool secondary)
> >  {
> > +	unsigned long i2c_scl_rate = I3C_BUS_I2C_FM_PLUS_SCL_RATE;
> >  	struct i3c_bus *i3cbus = i3c_master_get_bus(master);
> >  	enum i3c_bus_mode mode = I3C_BUS_MODE_PURE;
> >  	struct i2c_dev_boardinfo *i2cbi;
> > @@ -2466,9 +2498,12 @@ int i3c_master_register(struct i3c_master_controller *master,
> >  			ret = -EINVAL;
> >  			goto err_put_dev;
> >  		}
> > +
> > +		if (i2cbi->lvr & I3C_LVR_I2C_FM_MODE)
> > +			i2c_scl_rate = I3C_BUS_I2C_FM_SCL_RATE;
> >  	}
> >  
> > -	ret = i3c_bus_set_mode(i3cbus, mode);
> > +	ret = i3c_bus_set_mode(i3cbus, mode, i2c_scl_rate);
> >  	if (ret)
> >  		goto err_put_dev;
> >  

Best regards,
Vitor Soares

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
