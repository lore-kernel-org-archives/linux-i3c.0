Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 610C2C5DF7D
	for <linux-i3c@archiver.kernel.org>; Tue, 18 Aug 2026 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYs2tXBCaFUe6hyxqVN0dSldTxOhRd9mFDnDjKxRZdk=; b=zAhixBTJ7OeBtS
	pVbX1aH/briWmBHpJXconkUpOfuIx0AN264LD0e4NX017GnWLQwk/f+f0VL7937Ee7Q6tBAKNwERx
	WFfqGSukx043fjZga7e5BUnuzSsH9cAskGS6Ku+8ZZeGttmep32+fGKy+je2FlmTl3nsJCNZjFswx
	CeskgVYADZOaEznhbfciFZq0holjtCcUxTTEOC3NQvmMEYVYojMc3JLOL0mtkPAc0L8C9Q+pl+PFj
	o0d3Ui38bmMx2MXzwxAzaUxkJVQNAgsBNanHC9G4ELZjdglK4evkvqhR9HA30ibWnfwFUlk+YGE3S
	MG5LOk3H5x6DihJPSoaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwR3i-00000008er0-0g8k;
	Tue, 18 Aug 2026 21:09:22 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwR3e-00000008eqV-0yXd
	for linux-i3c@lists.infradead.org;
	Tue, 18 Aug 2026 21:09:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A299A1A1700;
	Tue, 18 Aug 2026 21:09:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FD7060355;
	Tue, 18 Aug 2026 21:09:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C403C11C74F7F;
	Tue, 18 Aug 2026 23:09:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1787087348; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qjgZuiQ5VqE/zZwx9Lm/JbDGoTPEZuhLkhhuNL+u/fk=;
	b=TX4lUbl7R8gH8Tl4Ofis513EuIyO7e9cMyBu+2eJTZ9oUudnS+HonCKKEkYAKkjk+7ZHNI
	zL4JWU2ofXOonFeC/LQ4Yc1PHnuIrhfyvWZ8FYdNwxyGQ+isZxuzZclnbINn2pXIu4oiDl
	AGeCxOSsGcXf5RSQMNJXlZZDPhrlF6+KclsdIyCMdMNnTM9iFZ5dL9/8ni6nmJTyiUT2fr
	ucIeTWwbCevlsOmsUr2PNkPNTb2XFwiJrtI5VdFLdVKySlyuoX7tndlrmeBuPfJHUzcPqA
	N7N85+KPuvjLwdZN7yxjeRsvMKg2gfFYc6GxB+2iEY+dyBYTolZGlCUAcAN1LQ==
Date: Tue, 18 Aug 2026 23:09:04 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Jisheng Zhang <jszhang@kernel.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: dw: make struct dw_i3c_cmd smaller
Message-ID: <178708733535.4064704.83262836861442213.b4-ty@b4>
References: <20260813044603.22425-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260813044603.22425-1-jszhang@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_140918_418027_B16FD9BA 
X-CRM114-Status: UNSURE (   6.12  )
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

On Thu, 13 Aug 2026 12:46:03 +0800, Jisheng Zhang wrote:
> The dw_i3c_cmd is dynamically allocated, make it smaller. For example
> on 64bit platforms, we reduce the size from 48 bytes to 32 bytes.

Applied, thanks!

[1/1] i3c: dw: make struct dw_i3c_cmd smaller
      https://git.kernel.org/i3c/c/9939e4cf593d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
