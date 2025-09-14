Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AC0FCA0EE8
	for <linux-i3c@archiver.kernel.org>; Sun, 14 Sep 2025 20:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wNM/ur2Yy6c2dUfojTKmiE9JX/mGDx1KBGin2O6Jct0=; b=sETw1o9OeBnWmx
	w6fDcONhb3a3HNZd1pxMqOYSwtfFkZFRoOdsfbfWXeKXd2soDzRr/BQdB1Nnn1oWBi/ttRqPn9LcZ
	n9N/NSxp0THr2CzqBOfbbC9orzcNxzfqd1v2owWynenZe1xsxeciK8ITNsvzIkSXg4uwBr2FRW/nc
	2XEpDKaxHMG3JSL/7Q79jMpKKpRBr4UpORlGtKEw/oI3fkAyfFDdHfEQEdBZZ5qWSwUjVuhKipprV
	pcRgyARy0QPE7WxF4lOlOH+HynBxH2+u99wk1gtaGfxxipTXsCqiarX4ne9H0JZJqV3FSp78p/Lpc
	7pTNou20YI9SbvNUrZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtiu-00000002C7j-2xSs;
	Sun, 14 Sep 2025 20:53:24 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxtir-00000002C7I-2JHH
	for linux-i3c@lists.infradead.org;
	Sun, 14 Sep 2025 20:53:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 557834E401F3;
	Sun, 14 Sep 2025 20:53:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 163506063F;
	Sun, 14 Sep 2025 20:53:19 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BCCBC102F2A78;
	Sun, 14 Sep 2025 22:53:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1757883198; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=iYzXZ3Wfu3kuz+opj/Qn7fQ4dEnCR2b0EnW78bmdoVg=;
	b=fEdHXYk9/shQBBHSAcAU5UL56PKn4RwI53fRAxvx9FTkaiMzizZJ+xZuueBrHCUV0+xFNk
	w9hAIIUK0XgzIJt8VKLiJzWg8tGp057ag1Z2RebXjnG9gjv0xVZku/FSVT4NmPd1Vxye4A
	80Zrpv1NzhtGEfHWXYmgILI715PDbQkVhPaghzuCnlAeg/ZQuyPZxOOEtTuOKY0vUopznZ
	Qnip/lEUVi6VeuGJJWHfQiy3DzTVYdnxK1wbtatabWDEUgbjOQ7St8wsVxMM1Cmbt9cVab
	9w5uO5J2Sy1Z+RSRM6/stzE7NoFwqsgpYNiWg12eytxBA3RF35PALnIYM8BGnQ==
Date: Sun, 14 Sep 2025 22:53:12 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Jorge Marques <jorge.marques@analog.com>
Cc: linux-i3c@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, gastmaier@gmail.com,
	linux-hardening@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 0/2] Add ADI I3C Controller
Message-ID: <175788312841.382502.16653824321627644225.b4-ty@bootlin.com>
References: <20250827-adi-i3c-master-v9-0-04413925abe1@analog.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250827-adi-i3c-master-v9-0-04413925abe1@analog.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_135321_723919_D421F429 
X-CRM114-Status: UNSURE (   8.32  )
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

On Wed, 27 Aug 2025 15:51:57 +0200, Jorge Marques wrote:
> I3C Controller is subset of the I3C-basic specification to interface
> peripherals through I3C and I2C. The controller RTL is FPGA
> synthesizable and documentation is provided at
> https://analogdevicesinc.github.io/hdl/library/i3c_controller
> 
> The main target for the I3C Controller IP is low-cost FPGAs.
> In this version the driver supports IBI (only the MDB), I3C and I2C
> transfers.
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: i3c: Add adi-i3c-master
      https://git.kernel.org/i3c/c/646bc816e071
[2/2] i3c: master: Add driver for Analog Devices I3C Controller IP
      https://git.kernel.org/i3c/c/63cae74bea7c

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
