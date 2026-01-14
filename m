Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B18ABD37E3D
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:02:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SEV0ejMftqKEVM3yRxU+KWKNwHmME9W8Pur3SrVrrDI=; b=anUQ7ALZbi8NUP
	ed7nNY3POmG4fOZtx4BH1AsMCOZYB+COOzQNxRtx2hwYQuip1UmypXgYBcPLfX0iGBL0JZ4cb3M8L
	WWZ+WF2eykjFfsu3KNEtBZBN/74eIUKBBUfDuR+LaZPU94vUHzOUex1Cge2y5lXATaCT1HljsVMil
	E2ZpGbXpnY1jOwt2Y2VYyPpjYn8H4s+u08aKOfcl/0uy7P9EVuVAhP5KAk5T+PAEjgUBmOgeo8Uh6
	tWh00oVKjEzNsSNDMJ0zFBLpY5aTSXqiTiOxnQ1Qz1NA9iwZJgHvqzVl9rbWdfn8P/Mr4Op00sRlC
	9luZk1cnYET00qbnkkBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2OK-00000009buY-1rKq;
	Wed, 14 Jan 2026 15:02:36 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2OH-00000009bst-3atI
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:02:35 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8AAF8C1F1C4;
	Wed, 14 Jan 2026 15:02:05 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34D216074A;
	Wed, 14 Jan 2026 15:02:32 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 74CFD10B6826F;
	Wed, 14 Jan 2026 16:02:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402951; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tWaA948prfAmMRQ9VfzvHVRWnsG1BV8sPk4dRJEpl/k=;
	b=o+HpzWHTnN3SlILpcnlKxedLiXLevc1zuv9d8FWDK6bO5+oEUHyHN/0QfDCDmkZ61AZGJY
	xISpSRym+SiK4A4D+VrGx0M75I6QDk3JJJIWkTUzl/736ZjMSnagaoJ2MebldcRnii2/ki
	12CSNcsXYBuuHqwb69CjTV38Cd0kVjVUrQW3yRt7XcvwLBTt/9IkPYxlPpRLBlbC0N3Ynf
	+epjbDK93wBIV8F5rbAK1WInhggiAzNTc3ZOIjVhENw5+DyXS4RrG9CJPzmVPNE7UpATRZ
	BfyF5mPj4kHbM9J+1nipAkm5NzupOdyHf7t5BpfbVlhFhV+WVISn7psu0M1qmw==
Date: Wed, 14 Jan 2026 16:02:31 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Frank Li <Frank.Li@nxp.com>
Cc: imx@lists.linux.dev
Subject: Re: [PATCH v2 1/1] i3c: drop i3c_priv_xfer and
 i3c_device_do_priv_xfers()
Message-ID: <176840281751.1259180.6949053829974625143.b4-ty@bootlin.com>
References: <20251215172405.2982801-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251215172405.2982801-1-Frank.Li@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070234_033007_27E325B8 
X-CRM114-Status: UNSURE (   6.47  )
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

On Mon, 15 Dec 2025 12:24:04 -0500, Frank Li wrote:
> Drop i3c_priv_xfer and i3c_device_do_priv_xfers() after all driver switch
> to use new API.
> 
> 

Applied, thanks!

[1/1] i3c: drop i3c_priv_xfer and i3c_device_do_priv_xfers()
      https://git.kernel.org/i3c/c/9904232ae30b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
