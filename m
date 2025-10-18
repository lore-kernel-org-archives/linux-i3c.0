Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D67CCD195
	for <linux-i3c@archiver.kernel.org>; Sat, 18 Oct 2025 16:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wx5pZGcgIeYLJmE1yfDS21QMsuZ7agPA9oqGRQx75hY=; b=3H1EUROyjHUDpE
	RiZVNjt9MG/kUWkDQ32yp8khzIwowNhc1YZmOjhM3Qgh00JiMz1+ZVi+xFKEBrrID5qy0490oen3E
	Xq8kquu9Ibdzb3IZoOfYwF9VFitjrPhi0ZfBX64HSvTSoZEVFF126N2xRU09PDDNgVXph4bO2hlKS
	WoeW3PHnzEJ+wp0I+eSGfJoScvKUCnBvLrRrMEO8lsl/kxKZdY01YbwceyWn94sUEWi9LNW5w1cOY
	krJ7SWpzqzr1sYB1RG1HuIWaaT6qwoe1kafCX9Nn2K4UCtgTamUKaykJqfWoNa902rLc0zxQr+zhy
	Dvqdd7eZCsHHzIjEYUuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAAe-0000000AAXn-2xrP;
	Sat, 18 Oct 2025 16:52:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAAAc-0000000AAXV-0U3V
	for linux-i3c@lists.infradead.org;
	Sat, 18 Oct 2025 16:52:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4537C41A41;
	Sat, 18 Oct 2025 16:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA17DC4CEF8;
	Sat, 18 Oct 2025 16:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760806361;
	bh=3AQR1+KFQiELiXUBQu7oglYF6TJ85eITEGgQwbzI1yY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F3SQRmZj95mgUG2hXYdlgpHzPIbgwK0cQfpSVMVrbv8pAAkpGOQEqZOLAH0ITEZ+m
	 cyK6blLmOfrLywNaUY89AHcMarte6dL/SLqlFeZ+WaMGAxGvdamXmMWMTA6lfJIA/u
	 z8oGyMeHMKZlt93e9EADqwcNvU6mHL/scPg/0iSk6enwWyNMnRmZ5O3p44w/1U09rR
	 YtNqvj8l8z5T9tKurksQHfg1aEIlQ0jm3/CGYo92FkctGZMU+z7+bO88fmj76jrLJs
	 OlUO6S8lu7O6trq+CerP1TG9pMvY3f7OdSBBMFvWSqMLAXoJoIK+G4d6YKqssUcFyF
	 oo3UbFjKPnO7Q==
Date: Sat, 18 Oct 2025 17:52:32 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Miquel Raynal
 <miquel.raynal@bootlin.com>, David Lechner <dlechner@baylibre.com>, Nuno
 =?UTF-8?B?U8Oh?= <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-i3c@lists.infradead.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-iio@vger.kernel.org, joshua.yeong@starfivetech.com,
 devicetree@vger.kernel.org, Carlos Song <carlos.song@nxp.com>, Adrian
 Fluturel <fluturel.adrian@gmail.com>
Subject: Re: [PATCH v6 5/5] iio: magnetometer: Add mmc5633 sensor
Message-ID: <20251018175232.064a8aee@jic23-huawei>
In-Reply-To: <20251014-i3c_ddr-v6-5-3afe49773107@nxp.com>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
	<20251014-i3c_ddr-v6-5-3afe49773107@nxp.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_095242_185418_994FD612 
X-CRM114-Status: UNSURE (   8.12  )
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

On Tue, 14 Oct 2025 12:40:04 -0400
Frank Li <Frank.Li@nxp.com> wrote:

> Add mmc5633 sensor basic support.
> - Support read 20 bits X/Y/Z magnetic.
> - Support I3C HDR mode to send start measurememt command.
> - Support I3C HDR mode to read all sensors data by one command.
> 
> Co-developed-by: Carlos Song <carlos.song@nxp.com>
> Signed-off-by: Carlos Song <carlos.song@nxp.com>
> Co-developed-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> Signed-off-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
LGTM.

So my ideal case (assuming i3c parts are good to go) is an immutable
branch in an appropriate tree that gets merged into both i3c and IIO trees
and has first 4 patches.  I'll then put the driver on top in the IIO tree.

I can spin one if that is useful.

Thanks,

Jonathan

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
