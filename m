Return-Path: <SRS0=JcjT=OW=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63D4CC65BAE
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:47:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32E1720870
	for <linux-i3c@archiver.kernel.org>; Thu, 13 Dec 2018 12:47:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KYLGtlCP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ug2f9qz5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32E1720870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGn4Nq5UshN7sPmkKw842i0FiXSbdp9IafIF8JclkZY=; b=KYLGtlCPbkRKxd
	uFLVOgzqwmcaabS0JBPlh7CgjdlOTOv+znhyHS7LK2VC03wHYB0O8C0ydXR7qwSUuy4HKeeKnTQmj
	T1KjaBdj9KEaTz5/a7ieRIJHWsDel2ujXq+u4VdWF2PEbrzlwzxBflwvS9B7Hg+/97f7rOikqtI/g
	NeeyK1GCRKgyQsj7ZMab0rnM2HpVAwgBBCrJwSU9/7ZoRTy/wJg+G9Roq0PVXQZhnAQANsFgjBd9F
	D9yYYjT2bM5Y5QPKEEgjpZNr0ff53o47+xbI5bjKxVKhLURCGHi92E2fB1NLC19TYPWwJNElFSoFv
	w2324/hxrKpMI3+NJRyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gXQOj-0001Ra-Oa; Thu, 13 Dec 2018 12:47:25 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gXQOg-00010a-R2
 for linux-i3c@lists.infradead.org; Thu, 13 Dec 2018 12:47:24 +0000
Received: from bbrezillon (aaubervilliers-681-1-89-7.w90-88.abo.wanadoo.fr
 [90.88.30.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5109220870;
 Thu, 13 Dec 2018 12:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1544705232;
 bh=VfTd6xBVi8nHKuC6JAgE/dKfpEZ95i2M0k0fCVBWCdk=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ug2f9qz5ACK82/4qLZFxKtv/gQIzFU2VZXZrxwI5muLEFkcU/3DY9N/OieHIR11IG
 N2lJKNLilplYUiDKSOixCUEKzqW0wcd8B45xsYJngcdezb/FJH+Tv7O85UeXfRMaPs
 +fXwbMcklN5LsyWQkLuXCnCKFn0HkA0eVx4+Li2E=
Date: Thu, 13 Dec 2018 13:47:05 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: Przemyslaw Gaj <pgaj@cadence.com>
Subject: Re: [PATCH 0/2] Add the I3C mastership request
Message-ID: <20181213134705.7d33dd3e@bbrezillon>
In-Reply-To: <cover.1544703840.git.pgaj@cadence.com>
References: <cover.1544703840.git.pgaj@cadence.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181213_044722_893396_54ADA315 
X-CRM114-Status: GOOD (  10.83  )
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
Cc: linux-i3c@lists.infradead.org, psroka@cadence.com, rafalc@cadence.com,
 vitor.soares@synopsys.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Przemek,

When you resend a patch or a series, you should prefix it with [PATCH
RESEND] and explain why you're resending it.

On Thu, 13 Dec 2018 12:27:59 +0000
Przemyslaw Gaj <pgaj@cadence.com> wrote:

> This patch series adds support for mastership request to I3C
> subsystem and Cadence I3C master driver. Mastership request
> allows slave to become the master of the I3C bus.

Thanks for working on that.

> 
> Przemyslaw Gaj (2):
>   i3c: Add support for mastership request to I3C subsystem
>   i3c: master: cdns: add support for mastership request to Cadence I3C
>     master driver.
> 
>  drivers/i3c/master.c                 | 260 ++++++++++++++++++++++++++--
>  drivers/i3c/master/i3c-master-cdns.c | 316 ++++++++++++++++++++++++++++++-----
>  include/linux/i3c/master.h           |  43 ++++-
>  3 files changed, 560 insertions(+), 59 deletions(-)
> 


_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
