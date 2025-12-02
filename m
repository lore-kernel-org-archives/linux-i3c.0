Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD80D1171A
	for <linux-i3c@archiver.kernel.org>; Tue,  2 Dec 2025 17:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bk6RedaTNga2FQ6J2pvr7Om3T1Ui2Q29UCxPNkx0N1o=; b=Uc3KkTdAhnf9hX
	nxIP8hWA5xPdWhd2IbXEmEfB6dXGz3gc58jhudd5eZF9dRCmLa1hctu//sTsYdt21T6vAEkaRZvuH
	UjTmeZWWwbqB11dEPEMobiwA77kJsFI51DRrkF4Pggy3W5PPkXRmQvb9J14+Qj3K+BAbq9upivXM/
	j/RzYlKBSJtMH79RGl5mNiFrvpFRp8y70c7R8W5EQwvKwCWvE1e2pySr+8icg3EoOFPO/aZZfqhdg
	UNukZSGqKpjU87AUiUYFIlcJ8OieKHK7tOX1EQp4rDKocYn0tQsivIZJDuT+TEyNzK9SkzC97hi+J
	/aIdHOEDUDmEjs0vJNFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTqd-00000005egw-2Mjg;
	Tue, 02 Dec 2025 17:07:31 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQTqZ-00000005egJ-1Nfo
	for linux-i3c@lists.infradead.org;
	Tue, 02 Dec 2025 17:07:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id DF36B4E419E0;
	Tue,  2 Dec 2025 17:07:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B305C606D6;
	Tue,  2 Dec 2025 17:07:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8A2B111919DE1;
	Tue,  2 Dec 2025 18:07:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764695244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=6Er31q3t3D9gDuRWCtmdgM2TNfpxlbVnIHYGvg/Vq/c=;
	b=Mvju4zv1UyTlkJNTxNx8wDVLUVXLZ/EeOiQS6vKcvKy1up6MPthK6/BtaBYRFYjqwJop/9
	/wryL3GpnX3d0tJe+cIYz3QY6J+bLto6sLBrP7OVqXkJtEmZbgr5xWS/Dy+jtf8JRYg6/v
	p+SjOOIC1rUNgLb4ONS2ZFhKjp+f9sNOOVj1d4icJzeAdxcWOf+Doquvbw+Ons7pfWppHi
	On9a7deMVX5QKmeRd6Ed44STYFYYdk9OB+tneBwtQTIulfQfTZgwRgj+BF4djdk4cKUl9n
	TV2r8coBIPzA9qRKq70l+CrTOHPAE0V7pFUnn5LgxAtN28mRCMX0XrpxD8HjyQ==
Date: Tue, 2 Dec 2025 18:07:19 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-iio@vger.kernel.org,
	joshua.yeong@starfivetech.com, devicetree@vger.kernel.org,
	linux@roeck-us.net, Carlos Song <carlos.song@nxp.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Adrian Fluturel <fluturel.adrian@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: (subset) [PATCH v11 0/6] i3c: Add basic HDR mode support
Message-ID: <176469517224.2676946.11188643090832836705.b4-ty@bootlin.com>
References: <20251106-i3c_ddr-v11-0-33a6a66ed095@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251106-i3c_ddr-v11-0-33a6a66ed095@nxp.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_090727_498039_076AF8BD 
X-CRM114-Status: UNSURE (   6.68  )
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

On Thu, 06 Nov 2025 12:35:59 -0500, Frank Li wrote:
> Add basic HDR mode support, only support private transfer, not support
> CCC command.
> 
> Update i3c framework API to allow pass down mode and extend driver callback
> function.
> 
> Implement HDR transfer in svc i3c master driver.
> 
> [...]

Applied, thanks!

[1/6] i3c: Add HDR API support
      https://git.kernel.org/abelloni/c/256a21743d91
[2/6] i3c: Switch to use new i3c_xfer from i3c_priv_xfer
      https://git.kernel.org/abelloni/c/9280b6ebbf08
[3/6] i3c: master: svc: Replace bool rnw with union for HDR support
      https://git.kernel.org/abelloni/c/108420fe2100
[4/6] i3c: master: svc: Add basic HDR mode support
      https://git.kernel.org/abelloni/c/4e7263b87ca3

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
