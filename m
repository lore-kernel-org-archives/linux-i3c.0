Return-Path: <SRS0=cSKn=QE=lists.infradead.org=linux-i3c-bounces+linux-i3c=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A522C282C8
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 11:53:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0319D2086C
	for <linux-i3c@archiver.kernel.org>; Mon, 28 Jan 2019 11:53:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sNhEYmp1";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZBB2aUi9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0319D2086C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aqQDlFt5E/wWC55oyHOVQMOSoBs2mvigv2zRIbvfD/o=; b=sNhEYmp1Nqt7yh
	mbFpP5mZ6RkIcHCzeVggOrd6oeurcnIZjOdX2KCggm/LHES1VIrFFOfi4PTIgLZC6tKIkmRzrtDfT
	za9P2Fid5UgOFmPlJyLSIuXaFFUS9ollgUsPWrzrX5zNpqWrhKyj9sUUrIKfRQYBp28+aZrrY/Slj
	dR2dNpRCu2/wN/4HtqY7TYwK3cxbm9Iho8LTc9QnODPxfnhA0E07u/PdYuJkQhd9IuFuIJF6+vTnP
	8Kg0oSPZZCCWyL5s+v+4G3Bupq8OAbGqu8WUknyDU8W5vCUmgXF8O04z5EMG+7ad0tl9YoyPyJkED
	/MEjsL2mLW51deGeHKuw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1go5TJ-0007gP-Jv; Mon, 28 Jan 2019 11:53:01 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1go5TH-0007g7-7W
 for linux-i3c@lists.infradead.org; Mon, 28 Jan 2019 11:53:00 +0000
Received: from bbrezillon (91-160-177-164.subs.proxad.net [91.160.177.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DA2EC2086C;
 Mon, 28 Jan 2019 11:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1548676378;
 bh=Uwtlc9qM0gLr209Nf8SDgiFtsIN/g4fiRInNhaE5/ok=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=ZBB2aUi9mPPhg52MdK1yJUulHgO8x9eLXCNYrz68TIjIEoXW36nZCRUw5MJAqWDES
 RDnjcFfpVhJtrbA4cH6KMoFtN08VZEemKXTW4Yju45kxE/ZjNTT3J6ve10oHvGVCHn
 eC4/Xr+wNWtpIUAFeRKuxdzrfFmv8nBOFHmN40H8=
Date: Mon, 28 Jan 2019 12:52:51 +0100
From: Boris Brezillon <bbrezillon@kernel.org>
To: vitor <vitor.soares@synopsys.com>
Subject: Re: I3C Tree - Development flow
Message-ID: <20190128125251.377f4faa@bbrezillon>
In-Reply-To: <12d083d6-3973-0d07-ccc9-c28c2ae1aa81@synopsys.com>
References: <12d083d6-3973-0d07-ccc9-c28c2ae1aa81@synopsys.com>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190128_035259_292340_7C08D34B 
X-CRM114-Status: UNSURE (   9.93  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-i3c <linux-i3c@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

Hi Vitor,

On Mon, 28 Jan 2019 11:35:36 +0000
vitor <vitor.soares@synopsys.com> wrote:

> Hi Boris,
> 
> I'm not understanding the development flow.
> I see the fixes going to fixes and master branches but not to next.
> 
> I was expecting that next has the most recent fixes/new features
> which it isn't the case. Any advice?

i3c/fixes contains patches to be queued for the next -rc (right now
it's targeting 5.0-rc5) while i3c/next contains patches to be queued
for the next release (5.1). That's the workflow in use for almost all
subsystems. If you want to have everything in a single branch, you can
use linux-next or create your own branch in which you'll merge
i3c/fixes and i3c/next.

Regards,

Boris

_______________________________________________
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
