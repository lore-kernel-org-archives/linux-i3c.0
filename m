Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFBA1103E2E7
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 21:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/VuLIHexRj4HXL/U1cQmF3jAe+/khzwF6c5fBQsvx4M=; b=XAKuRJkjKRRqfk
	wR9pZ8OFP40I/2iLVCC/z6T6UjgCtBSZlvGm1TZCLX9a5O4zwaemhNNcbjXxRTS3gcknGUqPb469O
	bSV38The8NaNyLrWU1jv9RmZ4tA7m4Hqe+A9s70bIFN/BSw4MKHguH12Fhbj3zGJ4jaFrjkGjb/BL
	O8bVz+coirY3RqA3QQoF4ghHoCETeIaYXS2W9ojdlLFw/Bv8UFmZYeFNdwPioyTMWAHhg1SUMr8Z6
	k36hwyYpmUKf5H8nFQTOrzEssp3xDolKLw+D4MOVTfBES2tEMqusa5h5bAj5yVbyQLpvG3mYZB/tC
	Osv4nvQCEZztqE8EGLxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RUJ-0000000Ca8z-2lTn;
	Wed, 11 Mar 2026 21:53:07 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0RUI-0000000Ca8O-0FaY
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 21:53:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id AAA6F1A2DCD;
	Wed, 11 Mar 2026 21:53:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E27860004;
	Wed, 11 Mar 2026 21:53:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1B63B10369BFD;
	Wed, 11 Mar 2026 22:52:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773265983;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=dj2++XrCwB8uFq2Ku+Y2zsBo0dnRILVNESoXb8ji700=;
	b=Jz4kKoLakEO2Ys1TUpF5xePOLGbwYZlDB01aZT8V0hZ2do0zfkehl8njlXobL9IyUO5+AB
	DuqQX0Q5fOs/PX+ueLWjNMCib2vOL05ORap+uWl34puetw7Su9kpo6y0jqHubRgXSFVLZK
	KVnAb5ltDOecO1VQLwcjUfA0v+Cx+GkuyzRXXYggUISGuXazmW5QHGVhK5MADtfXtjh3bN
	K1VgFUh0iuE6TKxgESTG96dRINdFhhMdZHWh5cc5bSdejhrZqvkEKYPTrFgQigG0CVonCj
	ldhSK8SLgQvSVS/OhPnnJl6VQJSZt+Snlg7hGIg71NchD0V+hZgnM1cj9Z9NvA==
Date: Wed, 11 Mar 2026 22:52:58 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>,
	Adrian Ng Ho Yin <adrianhoyin.ng@altera.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Manikanta Guntupalli <manikanta.guntupalli@amd.com>,
	Zilin Guan <zilin@seu.edu.cn>,
	Jorge Marques <jorge.marques@analog.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Peter Yin <peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v3] i3c: master: dw-i3c: Fix missing of_node for virtual
 I2C adapter
Message-ID: <177326593348.2388749.10335592300269012513.b4-ty@bootlin.com>
References: <20260302075645.1492766-1-peteryin.openbmc@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260302075645.1492766-1-peteryin.openbmc@gmail.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_145306_236823_DE08FB8C 
X-CRM114-Status: UNSURE (   7.82  )
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

On Mon, 02 Mar 2026 15:56:42 +0800, Peter Yin wrote:
> The DesignWare I3C master driver creates a virtual I2C adapter to
> provide backward compatibility with I2C devices. However, the current
> implementation does not associate this virtual adapter with any
> Device Tree node.
> 
> Propagate the of_node from the I3C master platform device to the
> virtual I2C adapter's device structure. This ensures that standard
> I2C aliases are correctly resolved and bus numbering remains consistent.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: dw-i3c: Fix missing of_node for virtual I2C adapter
      https://git.kernel.org/i3c/c/f26ecaa0f0ab

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
