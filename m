Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93414CCF9F0
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Oct 2025 23:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mdcG09kfz+s3CYAyH6kvybGbtsd3VO0p7BxEAQ/kji8=; b=E75rHo93VoNUrl
	5l9HsO2XpZA0U6Z4lR9hO0g6EGFHC62XgFm11ugNHTTgf2i7nCnSB7b7JUhLb+/oKJZhiEEAU3rK7
	qUVxD6jNLwSRJQLw9KbIEndiISNeIHDmbOSB9MJe/Pg0kECe2IKPI9iV3MTzI3jmIDHyojZoHTwDV
	udTJQII8woLgqFtSf4SGuooD4/u8oQ0X+bDNteY1w0N1Fsds7eSZGzK1HgAwIiTk+R4FMj8htOw4h
	YCl57WO8URLoyEWOwS+zTuU0HV+981zUVvDEQcgm8nmkZn1ZIt7SmzzZOwfUqFpKf6rWFtqK6832o
	S+yhdg6qhzDZoSpIKTNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcJF-000000059e5-1KVa;
	Thu, 30 Oct 2025 23:44:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEcJC-000000059dJ-2hfR
	for linux-i3c@lists.infradead.org;
	Thu, 30 Oct 2025 23:44:00 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 692F01A1787;
	Thu, 30 Oct 2025 23:43:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3720560331;
	Thu, 30 Oct 2025 23:43:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 77C5D1180CD97;
	Fri, 31 Oct 2025 00:43:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761867835; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=qvxEnhZb6oDPTVmo+kM1osfS4tfXtLekEB3w4t8Vy7o=;
	b=ZJXolIxN8r/swzcYwB9QjHmVjIjk5u1keTmpiV/nlGeVAMyxYnoxwl8M7SAnfqdlbV/wiu
	MYv0oHdYuq+S55XaMBPQS7OsgBEQ3oOo30HMBz7pxLnq0gGsqUWrkuNt2DwBOFio+NzN/9
	1HOJo/ifDgmMAGjK51Fq+b2fHEoWWKxBE7vnno9hCVjKOeoj5QGKcNusg+dVK3KTDVu/PP
	T36qtEDUgOR392RICvI7tXwJiml1HqWzVzWOWqdSDxpMjBgIRdOHfYUTayLkplqIPu+1pA
	du2urNzAeAEADzpvYeMN0xHHLKbj8j9GdtsLBF1eL7v3JGIkn5/3a1F94i1NnQ==
Date: Fri, 31 Oct 2025 00:43:53 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: frank.li@nxp.com, miquel.raynal@bootlin.com,
	linux-i3c@lists.infradead.org,
	Stanley Chu <stanley.chuys@gmail.com>
Cc: linux-kernel@vger.kernel.org, tomer.maimon@nuvoton.com,
	kwliu@nuvoton.com, yschu@nuvoton.com
Subject: Re: [PATCH v2 1/1] i3c: master: svc: Prevent incomplete IBI
 transaction
Message-ID: <176186765080.475593.4340016806079643013.b4-ty@bootlin.com>
References: <20251027034715.708243-1-yschu@nuvoton.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251027034715.708243-1-yschu@nuvoton.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_164358_979310_2229E6D2 
X-CRM114-Status: UNSURE (   7.08  )
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

On Mon, 27 Oct 2025 11:47:15 +0800, Stanley Chu wrote:
> If no free IBI slot is available, svc_i3c_master_handle_ibi returns
> immediately. This causes the STOP condition to be missed because the
> EmitStop request is sent when the transfer is not complete. To resolve
> this, svc_i3c_master_handle_ibi must wait for the transfer to complete
> before returning.
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: Prevent incomplete IBI transaction
      https://git.kernel.org/abelloni/c/3a36273e5a07

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
