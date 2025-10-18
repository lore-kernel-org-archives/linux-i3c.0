Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEC9CCD195
	for <linux-i3c@archiver.kernel.org>; Sat, 18 Oct 2025 16:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AYvJe8d/gsUzGd95ftK8H7lP2TezKCyj4iZRbmWN9fI=; b=H0Rg+v2cz1oPcp
	uji+nEjuZX7XQdfgSVGmcmtEe17yCJEkpHfLMMb6f44XkQp9NrES8EaYmAmQ4pXDDQHTSji9ph3l7
	wKAyMJN8R3WwDNxXyqSczqRu2JF+4CwH3Lx1p1G1l+A9Bp9c/5VHS/Pqp76jT5AyEDY/J2p8I4zr0
	9q7FE6OHurrUEmj647FmoDfTzVm9vLuyDtpitsQYYZlFRddBoxEsZ0GHO5Fkd1UiBgzQ28lOW8pRL
	aPjAcI+wYTJjzhSPKi/W7iWbeJyQrrhEtvYL8CRrSpOUlov5uv5kIwd8VCIpTU6wvBPtTSaksAsbV
	OWjaZyZq0b02P/ksQqBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAACM-0000000AAf4-0SOv;
	Sat, 18 Oct 2025 16:54:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAACJ-0000000AAei-30LR
	for linux-i3c@lists.infradead.org;
	Sat, 18 Oct 2025 16:54:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 593BF40353;
	Sat, 18 Oct 2025 16:54:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F11A7C4CEF8;
	Sat, 18 Oct 2025 16:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760806467;
	bh=9xCpoINAgwkfDm9boKe98rLyOvgdKQxkOpTeAJ69dXY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XgKNSd5pMfzDvdGWMTdY5LBJ2wBAm4wwQJ7roW1vNPCms93UkCiV+6dzxz+SE9+7w
	 vMfP+bxk4jIT6kKPJzbviikporKbXjDMXiBiF0WfO2KQWfwwyNOlMemL+bKRVPP7rI
	 CpK8UvBQGUD5VPQrryEO/MzoJfhrWAe5FiFLu4c+XRBSc69ljvsq4bzJs9E2i+4pEh
	 dYmz8hOXhRdN+H+LA/rLRowUVrAeLhJ87X6O6sO1HqcelwcNveAxVzMJIeGc/watK5
	 0k8pqb8uBozinERkxXNYmaIQUA7LaTxbrS92MIpmOhML8lZxpcrUhyaJSzJ7LpbZIa
	 ajFBZ0VgB5wHA==
Date: Sat, 18 Oct 2025 17:54:19 +0100
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
Message-ID: <20251018175419.7a6242a3@jic23-huawei>
In-Reply-To: <20251018175232.064a8aee@jic23-huawei>
References: <20251014-i3c_ddr-v6-0-3afe49773107@nxp.com>
	<20251014-i3c_ddr-v6-5-3afe49773107@nxp.com>
	<20251018175232.064a8aee@jic23-huawei>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251018_095427_782764_972C7943 
X-CRM114-Status: GOOD (  11.77  )
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

On Sat, 18 Oct 2025 17:52:32 +0100
Jonathan Cameron <jic23@kernel.org> wrote:

> On Tue, 14 Oct 2025 12:40:04 -0400
> Frank Li <Frank.Li@nxp.com> wrote:
> 
> > Add mmc5633 sensor basic support.
> > - Support read 20 bits X/Y/Z magnetic.
> > - Support I3C HDR mode to send start measurememt command.
> > - Support I3C HDR mode to read all sensors data by one command.
> > 
> > Co-developed-by: Carlos Song <carlos.song@nxp.com>
> > Signed-off-by: Carlos Song <carlos.song@nxp.com>
> > Co-developed-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> > Signed-off-by: Adrian Fluturel <fluturel.adrian@gmail.com>
> > Signed-off-by: Frank Li <Frank.Li@nxp.com>  
> LGTM.
> 
> So my ideal case (assuming i3c parts are good to go) is an immutable
> branch in an appropriate tree that gets merged into both i3c and IIO trees
> and has first 4 patches.  I'll then put the driver on top in the IIO tree.
I can't count. First 3 patches.  Binding and driver would go on top in the IIO tree.

> 
> I can spin one if that is useful.
> 
> Thanks,
> 
> Jonathan


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
