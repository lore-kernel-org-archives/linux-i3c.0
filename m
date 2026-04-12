Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1881E93800
	for <linux-i3c@archiver.kernel.org>; Sun, 12 Apr 2026 20:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8nwfspyn4pL47ahPnUEMt6nb3YHmbPc2LDgqJWvAXqQ=; b=jUYVcgLLGSXSxo
	kgLoiff4kDbFEdwMQJgODN1R4RfPYFv8HdAsJwO44weC/7JfEzW7zRs24lBZrFJ0Vpvco8GmzfOR1
	MMsVabiEDFrXqN/1U7RoqE7OcQA0cGrDChVvV6gDf5WWP+CpOycWXfaIbn0fzj0M5Hkw3oJTpZQ3/
	FGXvBK56sZmyUMM7PtniGpYIIr96GiMgi99yaZf7zE5gHxF+DFKsF4A7hV6PxJh9qIbigbSVRc/nv
	ZPUFjvzU2O68i6GRr1IL5WlwNtaZmTW94wXZ8lUMGi0NbAA+oX1/gwBVWWCizu6JnphUpzeDec8gJ
	l/xYw1xYhi1DjwhGOq2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC1EZ-0000000EfPe-1wzr;
	Sun, 12 Apr 2026 20:16:43 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wC1EU-0000000EfPJ-2Vk1
	for linux-i3c@lists.infradead.org;
	Sun, 12 Apr 2026 20:16:40 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5DB1E4E429E2;
	Sun, 12 Apr 2026 20:16:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1330D5FFB9;
	Sun, 12 Apr 2026 20:16:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B536E104500EE;
	Sun, 12 Apr 2026 22:16:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1776024994; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=YYgaBasPu/jNs2Sww7H5ka9hu3+0rgpJ63cKOKJsiiQ=;
	b=E+5vuCcY8XufyKdg61LHjIa8ao0Lemtd3QpFm2aXGsodRtAQVLh/XF7q7xxUBrEngeCfrQ
	Sws4n02B2Pb37njbWb9Hi/lA2d44xLw2l5hD18qw/pvl5O4zztiflEmnsgEVP62PljsCky
	NdHxfO6U4tj5z28ord/9O4rZgp7Dqr+6dxqkWWq9XPCCJZ/bT8Vc7dFRLNN1NVXJk/zm6k
	AmMlusSIfG2UAafaWjIdu2afO551qSMTj8uowrxDxpQFW9QeYYgdQtVVK6V8L2sdPq7EWD
	qEiHAI/RtBjapUEaJq5RODY2ryG4oAyKZQpBiaJMt4+9PKnXJxe7bzjXr0AfVA==
Date: Sun, 12 Apr 2026 22:16:29 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Eric Biggers <ebiggers@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	acpica-devel@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
Message-ID: <20260412201629345ffec6@mail.local>
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-13-akhilrajeev@nvidia.com>
 <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260412_131638_784097_38ED8D5F 
X-CRM114-Status: GOOD (  11.46  )
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

On 09/04/2026 07:19:25-0700, Guenter Roeck wrote:
> On 4/9/26 03:57, Akhil R wrote:
> > Add a regmap config and a probe function to support for I3C based
> > communication to SPD5118 devices.
> > 
> > On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
> > ACPI or device tree entry. The device matching is hence through the OF
> > match tables only and do not need an I3C class match table. The device
> > identity is verified in the type registers before proceeding to the
> > common probe function.
> > 
> > Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> 

Guenter, I guess you can actually take 11/13 and 12/13 for 7.1 if you
prefer as they don't seem to actually have any dependency on the
previous patches. The worst that can happen is that the driver won't be
probed because the I3C subsystem will not enumerate the device.


-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
