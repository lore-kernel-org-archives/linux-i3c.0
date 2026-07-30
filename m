Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05536C55162
	for <linux-i3c@archiver.kernel.org>; Thu, 30 Jul 2026 14:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pYlhW0ODDJBrcMjrtq6i9wBs9hRf+BsIKF5kKZDAWfw=; b=KPcFgEVHm+B3XX
	z7vlWuQocPaTVxkFOH3ArjY60YdjiLqgY7crJpURbSUaeHYVFfmTZW97IO/9MI75IqtodrtXrQRTJ
	kIsDcjD8EDQ9RoYY+DO3koboB8b4Rx1oP/6PK0BT19Sk0nMW5uWI26nLpBZ9Qmch1Bsc9VSnNcn/+
	Ipw9Pni/rKbQzXUv3etLtiXuAJB/q0ibEttOLhX1GSCffE5asgs3Zg9Yc24d6ahnHY2KWVGOS/VGK
	ONBjGoLtVxXOUz/h+VfPKS1lJykYQS7+3gO/LE10tu/ESWGMBv9OI1Vog7LVxEv5KDEnkPRhFAQ5T
	wjt+uM+EOT/uDRbt7HVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRy7-0000000AmEf-303a;
	Thu, 30 Jul 2026 14:42:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRy5-0000000AmE1-2xSX
	for linux-i3c@lists.infradead.org;
	Thu, 30 Jul 2026 14:42:43 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4D0A01A1324
	for <linux-i3c@lists.infradead.org>; Thu, 30 Jul 2026 14:42:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 20BCA602B8;
	Thu, 30 Jul 2026 14:42:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 37CB011C15D06;
	Thu, 30 Jul 2026 16:42:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785422558; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=ih/G7w9Q1uFwkyqrhe9BdCgmtuaQogd4NFDX+w0DU9A=;
	b=Swq17rS1+jH2ziyA86R2aOCI8YZW9tvKvhIg9PQH7MxttzxX3pZcCjw6ElgGsEKOk9lgRT
	Xegs/YdItMyKgsYbJNsaFaDrRSCbz8ErwVraZ/erpxElC0pS6Xcn1/ujPaTdP4zQz0PTJO
	pRdbC0uDATI7seQNe99lSDZQHqGez5YVWvGaRa+7gtaSOP1l+HKR5MLXpikAkovpa25rYL
	R5W8uKGYLHhLPAJRNLNhNJPHv9t0fddE+zCESpUT5FT6w5GFZdkakd1562/It7lLUKsBIp
	ZV/EOsX3u7hjSypwXSZ9iKXQqgI45D1X/qUdHGku9T7WUvOq+wOxBUrHYPweTA==
Date: Thu, 30 Jul 2026 16:42:37 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i3c: master: Fix info leak and UAF in device unregister
 path
Message-ID: <178542243595.1793527.17198193788870118191.b4-ty@b4>
References: <20260723075747.34049-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260723075747.34049-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_074241_886954_FC66AF12 
X-CRM114-Status: UNSURE (   8.01  )
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

On Thu, 23 Jul 2026 10:57:47 +0300, Adrian Hunter wrote:
> i3c_master_unregister_i3c_devs() clears i3cdev->dev->desc before
> calling device_unregister().  During device_unregister(),
> device_del() emits a KOBJ_REMOVE uevent and unbinds the driver while
> the device descriptor is still expected to be valid.  As a result,
> i3c_device_uevent() and a racing modalias_show() can observe a NULL
> desc and fall back to an uninitialized stack struct i3c_device_info,
> leaking kernel stack contents in the generated modalias.  Driver
> .remove() callbacks may also encounter an unexpected NULL desc during
> unbind.
> 
> [...]

Applied, thanks!

[1/1] i3c: master: Fix info leak and UAF in device unregister path
      https://git.kernel.org/i3c/c/6f056a769b9f

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
