Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29C28107761C
	for <linux-i3c@archiver.kernel.org>; Wed, 18 Mar 2026 21:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nhgYkppv1X9/fFri1RCOEc9Ao0XwLhTTsfNc+jQg9wI=; b=SQZvWsg5UP06r9
	rjMKEBy0n4CWrnqsh2OUcvAOQfxhGQMNpam83eU4DVQtWpM6SfN6DhLVJdSICmkhg3/UxjMFrU+E6
	+92U7lXbBHwi6tJpxJcWdevuIzTJMhK99sRLNxwwzBX+Uv0V3jN0zKDbfKDb7bR0uX/2SrXoGQt4T
	vmCnvexnH5obiRSUQPEyDt5r+Iw12Dim9WmSCvjdFAtTE9nkwyAKK23jX4xOHjqUHQqk4e3QX8bGl
	rMf9ALuZGDGr6ckmZxbjJBCHeljvlLpzqGFVFJlY+av7o3BPDcidbmKiJGfGQLcWNKFrZZKe7pLRa
	TuftlQD9GimnZo5m8rFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yOr-00000009NY5-3ZEm;
	Wed, 18 Mar 2026 21:25:57 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2yOo-00000009NX1-0R59
	for linux-i3c@lists.infradead.org;
	Wed, 18 Mar 2026 21:25:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D5626C5506F;
	Wed, 18 Mar 2026 21:26:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0C2836004F;
	Wed, 18 Mar 2026 21:25:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 29E2910450588;
	Wed, 18 Mar 2026 22:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773869148; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=TBfCDwN1NBGh0HHhy5LrBzLxbJJulMF534ZV5O9n5wc=;
	b=FQZgk8nDbmSYHUahG5fhlJPqHfiyXuCpfGGQv9gGbVR9LbH+hXjZib6dUfsG9/3YkfjqrD
	cdlvnwFDU6sClZkX2YmZVrITEq+YWxxDwinJlJTlQgksvIzvp+WCj6zzUCpIFjAa5ZDXFN
	t0iwW87kJI/hbxi2NYmbmeRayAUg8otN8Is6u43SaQazNCXkQ9Is+MNFy50PpUVwI9luAM
	pM3zmzkxxykcSI3wmMDNgYgTQfzUXdcnkGtwAc5C5jlnfTVshMXKQ/f3NThy142uDyoSmx
	3STUn3nk9UYQqkvJgw0aPICa8/HEHUaMgXgGAsJ9wkFMLmaqMjbpb1iOWB2YtQ==
Date: Wed, 18 Mar 2026 22:25:46 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Haoyu Lu <hechushiguitu666@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: fix missing newline in dev_err messages
Message-ID: <177386913315.4149699.772834407640388030.b4-ty@bootlin.com>
References: <20260317034015.638-1-hechushiguitu666@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317034015.638-1-hechushiguitu666@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_142554_706367_AFFCE425 
X-CRM114-Status: UNSURE (   5.58  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
Errors-To: linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org

On Tue, 17 Mar 2026 11:40:15 +0800, Haoyu Lu wrote:
> Add missing newline to dev_err messages in:
> - drivers/i3c/master.c
> - drivers/i3c/master/svc-i3c-master.c

Applied, thanks!

[1/1] i3c: fix missing newline in dev_err messages
      https://git.kernel.org/i3c/c/7ea9bfee2ee0

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
