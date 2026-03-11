Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE302103E2E6
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 21:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hlOuFFz3iGclANy30UV6pW/G4ebD/wDnQqIIlHSnH/U=; b=frUyOhtyfMgPwk
	tRohi/8h5Li1c/mjPXFWjpUEYOu8rLeCOHuQlQY+drHLvspS3tbYrKay8HN59HUeL7olGwZ9dZ04V
	xDRHWLNJe7gYWbANKgExG09j8bwTrmbZOxDXt9KW7b4i0NjOKM85GDy64hAkJRl+M6eivQPytwrwY
	hDkQsiiO3QbQCo4b810WnrK8uxt94XI3V7PRaqgU+yfTqWNDTdv5T+yauLhZGPA4+Bvoz3Orjth/8
	rtJbvNuto0igaZ2dt30yOTH+Cb/2okoPrOqggWFQLSQm5rLDLAbgHdzNk45EwCpVXqd4Ap/oNGI4c
	E11AeHMSZN2nbmwigIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RTv-0000000Ca4a-1aAg;
	Wed, 11 Mar 2026 21:52:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RTs-0000000Ca30-0AiB
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 21:52:41 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 07CF21A2DCD;
	Wed, 11 Mar 2026 21:52:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C502460004;
	Wed, 11 Mar 2026 21:52:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id ED1E110369BDC;
	Wed, 11 Mar 2026 22:52:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773265957;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=1CQa3HlVKpA7Zt8df8fVfrCsP58jrDjo5THxQFnL9zQ=;
	b=0Cql3txB7KNthrzRqn7ayNVOSRZwhoGegqum4iNnOLxgnHgt1+kn+lkoOUGzoVrEYhZcC/
	D9RJnwq1xzCnIMAggEVl7ONJRO2WjCiG3+SLzHu5GZ96E41CHe9nG2F0tFkvC5VQt4ElOo
	QDe3BXtpF3FGvhmdS7oAcShKS0t2neJyIcxSh7iyzTT0CqXDodfwRFDGAyiMeqeiXFIPNx
	FOiAY4vJHmp9iEqJ5KNTsg3y/iwMiEECSXXancFBS01Y77KNSCIfn1npZmca2WQv4XhN+8
	8lkzzPMpc9snuVhSB4t+oXCQU9BXeYEtN/gpJP0rSdJZOqOJLcIk6OwnR0vSvA==
Date: Wed, 11 Mar 2026 22:52:35 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, adrianhoyin.ng@altera.com
Subject: Re: [PATCH v2] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device
 attach and reattach
Message-ID: <177326593348.2388749.14698557344627271725.b4-ty@bootlin.com>
References: <53f5b8cbdd8af789ec38b95b02873f32f9182dd6.1770962368.git.adrianhoyin.ng@altera.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <53f5b8cbdd8af789ec38b95b02873f32f9182dd6.1770962368.git.adrianhoyin.ng@altera.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_145240_234538_417AB145 
X-CRM114-Status: UNSURE (   9.57  )
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

On Fri, 13 Feb 2026 14:00:48 +0800, adrianhoyin.ng@altera.com wrote:
> The DesignWare I3C master controller ACKs IBIs as soon as a valid
> Device Address Table (DAT) entry is present. This can create a race
> between device attachment (after DAA) and the point where the client
> driver enables IBIs via i3c_device_enable_ibi().
> 
> Set DEV_ADDR_TABLE_SIR_REJECT in the DAT entry during
> attach_i3c_dev() and reattach_i3c_dev() so that IBIs are rejected
> by default. The bit is managed thereafter by the existing
> dw_i3c_master_set_sir_enabled() function, which clears it in
> enable_ibi() after ENEC is issued, and restores it in disable_ibi()
> after DISEC.
> 
> [...]

Applied, thanks!

[1/1] i3c: dw-i3c-master: Set SIR_REJECT in DAT on device attach and reattach
      https://git.kernel.org/abelloni/c/f311a0578463

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
