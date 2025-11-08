Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B948FCCFA18
	for <linux-i3c@archiver.kernel.org>; Sat,  8 Nov 2025 21:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N638f6QcOhTgAVtAPa3mxOFmMoM1DtelNHnWakZb+/o=; b=W9WlejIbaDzSuy
	bhKQZYZkmjaeB0K7oBVcC5kMPm32hyHSS/5E5acVI13NY3ujMgqhtgHQtXMuAlpVWIQIRzS3aQS7B
	MdHTLbw1x0Tc5dbIZFxyVKoePo7V9NCgq9I9Py6mWT4ay/dBtJXL1x4uS3Rc4szSn+SEe0vhtRtVe
	ETHyHfz2Q+uSt3SIQRhk2UVR7bk6p1uEmpYn3D+auRo05+Sh6FTZ1oMxzZHdCAEn2ItfMqTunqRRk
	oSEkDo+u9qYfy+qYwETHwoCiAe9PASAvK5gn5mQAzKteElIcXoVq09K0tlkH2z2ZsEbA1P4+hABXu
	m1kIITHomcF/aqUeQAhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqxx-00000003VMq-23Lk;
	Sat, 08 Nov 2025 21:59:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHqxu-00000003VMS-1lhL
	for linux-i3c@lists.infradead.org;
	Sat, 08 Nov 2025 21:59:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 96E83C0D78F
	for <linux-i3c@lists.infradead.org>; Sat,  8 Nov 2025 21:58:57 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B042760710;
	Sat,  8 Nov 2025 21:59:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8846B11851355;
	Sat,  8 Nov 2025 22:59:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762639158; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=tUIgq2XIEhHzrIB0ls2HGJXUjzdJHMZkn5bQ7FCI82Q=;
	b=qV02SFaEJa0T2CHj19PWYLDOFtlPWMGbWXSk/UD23wJtperoVz3ibdRptOmGj7A/duYarN
	urG77GOR5GyP/nRxP20+dDxDUWKQziUtQ1FmIigJv1i4c2bqZyKujOTa4uXyiTEwqYSQ8E
	F5u/qPb7VAXww7APTAIUv5TYiwmnhnE/DCtStAmTj8YKnt52bZGCvcNc6x89VtOM2HV1xe
	rS7o/dHXyYUq8eCzz00Egm5Seio9tSKCXjtLnsa7DHHjaU0wO6kF2RLwP5o8V/UJt62Xfi
	L+8BNnISPhphkiz/JVpURNGKJVWBtX0HJ9Ls1IHTAkqNrWSubAlnuvszVxbDjA==
Date: Sat, 8 Nov 2025 22:59:16 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Adrian Hunter <adrian.hunter@intel.com>
Cc: Frank.Li@nxp.com, linux-i3c@lists.infradead.org
Subject: Re: [PATCH V2] i3c: mipi-i3c-hci-pci: Add support for Intel Nova
 Lake-S I3C
Message-ID: <176263914470.674321.16156477986379515747.b4-ty@bootlin.com>
References: <20251107060750.7995-1-adrian.hunter@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251107060750.7995-1-adrian.hunter@intel.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251108_135922_610088_351DD418 
X-CRM114-Status: UNSURE (   5.76  )
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

On Fri, 07 Nov 2025 08:07:50 +0200, Adrian Hunter wrote:
> Add I3C controller PCI IDs for Intel Nova Lake-S.
> 
> 

Applied, thanks!

[1/1] i3c: mipi-i3c-hci-pci: Add support for Intel Nova Lake-S I3C
      https://git.kernel.org/abelloni/c/ddb37d5b130e

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
