Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EC99E6BF3F
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 23:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T5UfJHhBRNC/EBexmKvHN7JY+fe9hLbVeSNZjKZWcho=; b=1JTysZmpzjj+9o
	J1uVfoA958M5rU89AxpeiGq3kCmwkESzb5ozruf+yXq0XJ8HhYRPtliMDwc77WJ4uWnF8ZL3LKLDM
	YP8wEGh6F8mQ4HTKITQW7XiFceXqT0Wai2vKWvCqFDmdd6bDWhWkjICCmd7cq7gRi1xpr4GNWSJxW
	qm4qcE0kjngQhiib/Hpz350u37eWWojjxTrssXLgOajTRnYXMGiFryhkCfevBVUyqB5mJX+P7rgET
	CTMuIbGilDS5TjDIoTO51up3qGjVqpaF41NooB/MaFRR9rtLmO6i5Z/7l7sGAzdgx3FWDa3HI9Vci
	TcjRy1R3MwIBBhroUKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxbM-000000025PT-3xHA;
	Fri, 30 Jan 2026 23:08:32 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxbK-000000025OS-2Kul
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 23:08:32 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 65979C22F6C;
	Fri, 30 Jan 2026 23:08:32 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B52466075A;
	Fri, 30 Jan 2026 23:08:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5A2C9119A88BC;
	Sat, 31 Jan 2026 00:08:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769814508; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=esFjGX7PVoikdhuFsu6ns1zVPyfdgVV0G5wpHH1AYfc=;
	b=Pfu8SV+sMXlV97fbEIt9Ihoc4HiI86EuCzYUhOH7F2RbE7WNhvdxakZArvJvBhGmT5FU6M
	a+I1ub7fFOLfVJlc29hW0O1AT+s8ufyE8ihFx1OmK8PmZJo6RHK/9BZwtzFmepcjq/ww2x
	2So6TCPDr+b05C7slrMJJtnEP02hSsNE3RMR40YOKrmcI1sjNnrkBo4myRrXWhOJdSubOg
	eTUmhfox0YbkKrrA7tMwmBIfn6f9QD8Ek/SL+jSOvC57OqWCfYv0s18JG30FCiL+2uaBLj
	KqpINh8bNkBr5Odow8XPXCw0KGi3YFgSPqH2CjwGJmnGa3U1lHQ+mJg1OYx77g==
Date: Sat, 31 Jan 2026 00:08:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Joel Stanley <joel@jms.id.au>,
	Jeremy Kerr <jk@codeconstruct.com.au>,
	Fredrik Markstrom <fredrik.markstrom@est.tech>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Jani Nurminen <jani.nurminen@windriver.com>,
	Ivar Holmqvist <ivar.holmqvist@est.tech>
Subject: Re: [PATCH v3] i3c: dw: Initialize spinlock to avoid upsetting
 lockdep
Message-ID: <176981440896.2224815.12703084283125667642.b4-ty@bootlin.com>
References: <20260116-i3c_dw_initialize_spinlock-v3-1-cf707b6ed75f@est.tech>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116-i3c_dw_initialize_spinlock-v3-1-cf707b6ed75f@est.tech>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_150830_737937_B4B16752 
X-CRM114-Status: UNSURE (   5.92  )
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

On Fri, 16 Jan 2026 15:29:42 +0100, Fredrik Markstrom wrote:
> The devs_lock spinlock introduced when adding support for ibi:s was
> never initialized.
> 
> 

Applied, thanks!

[1/1] i3c: dw: Initialize spinlock to avoid upsetting lockdep
      https://git.kernel.org/i3c/c/b58eaa4761ab

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
