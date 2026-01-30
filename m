Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 775B9E6BF3F
	for <linux-i3c@archiver.kernel.org>; Fri, 30 Jan 2026 23:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shFR3B3luYp0qckNI484UygjENTkedRtgWRQRZz/0u0=; b=nkaXVLziXmlRYG
	2aXJdmS3uCCIQhsTCVm2c1zF3vOIcqsteZjwELOSxAYgZAuJb+GVv7jA6yrqUy4vvHLARjTApmjao
	TK0vMXeoCeXB4cvx+2yTpAPdC4fFmlpYHXxYmCASDR3i4iQxKlTG0GJOBaVRCUfJHFipah4xGrZVB
	7cZ0CJMfI4CE242NG4DP/YOiCCeQiKw60VUCS5Achv5hrkgxlg2cB2UqDSgcnW7I1OIT5Zf4QW81H
	TdUhTxTjnvlGVcas1C6iToHi3/CIefyCX77eCzdUulg23sM6AYNUOtXGPA+33ymK4oIlMdf8z7Uu9
	DeDJnnpV/qRKY/+EKwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxbn-000000025TV-0tpv;
	Fri, 30 Jan 2026 23:08:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlxbl-000000025TD-16cr
	for linux-i3c@lists.infradead.org;
	Fri, 30 Jan 2026 23:08:58 +0000
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 13B74C22F6C;
	Fri, 30 Jan 2026 23:08:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7186B6075A;
	Fri, 30 Jan 2026 23:08:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36A40119A88BC;
	Sat, 31 Jan 2026 00:08:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769814520; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=z3qzEGeCZzlKWUMH9rAOhDn+utLXbz17XfgqxD0uKYM=;
	b=a9UVfyIVI/CceAbvp+8xoFg5WoWZBOeiy6YE3mSLC2iz/eOgp+tJiL2dKrOjIqyHayRcbF
	r5H/7751G2Y6I3iCW3Zq6WdGThhc5WXxxbf/LbDDeHiITULOzYl7ekrJ4Kwmav65bKCZmI
	5y1cKeKqXFzKq9VBpZ4Zt5NaLgy5AXMmiDxTQcZusqF7rBDyJt0pAAEzEKqjGM+Q8ZEOl4
	vqV6XXdf07OBPSLcKMnRkzSCE4j3qTkl4AdIyJv7anVLe30Z3v2PlEoop1IZHdi0Y8SPP8
	jN/DfD4qRUXKvJvu9lwFEhkf1ycqDXlONMliOCxOSJJBxxvVbwkT/R0H2DhSzw==
Date: Sat, 31 Jan 2026 00:08:36 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Zilin Guan <zilin@seu.edu.cn>
Cc: Frank.Li@nxp.com, aniketmaurya@google.com,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	jianhao.xu@seu.edu.cn
Subject: Re: [PATCH] i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
Message-ID: <176981440899.2224815.9388822314885453183.b4-ty@bootlin.com>
References: <20260126081121.644099-1-zilin@seu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126081121.644099-1-zilin@seu.edu.cn>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_150857_463697_E2F09BB6 
X-CRM114-Status: UNSURE (   8.90  )
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

On Mon, 26 Jan 2026 08:11:21 +0000, Zilin Guan wrote:
> The dw_i3c_master_i2c_xfers() function allocates memory for the xfer
> structure using dw_i3c_master_alloc_xfer(). If pm_runtime_resume_and_get()
> fails, the function returns without freeing the allocated xfer, resulting
> in a memory leak.
> 
> Add a dw_i3c_master_free_xfer() call to the error path to ensure the
> allocated memory is properly freed.
> 
> [...]

Applied, thanks!

[1/1] i3c: dw: Fix memory leak in dw_i3c_master_i2c_xfers()
      https://git.kernel.org/i3c/c/253708941351

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
