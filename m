Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C2C4C3DA49
	for <linux-i3c@archiver.kernel.org>; Tue, 23 Jul 2024 23:51:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n+OP5pJOHWAnV3ak9CVVcyqDAx4Hd+cWQQpPODrqbsY=; b=ns6KHH7780Vn1Z
	+FxgXIwWZXIhVRx+W1LQLhDC9CblUWWgiuu+tUfUto3F9As52F/WLWmbMgZbrKfYckKl1w5DPJGdI
	M3Wn9hQrJowT9uZbc+XwrC8NIn3AbK06gSA9JJi0F/S3L0zH0BCKu9RrYJCkJ8ol5Jw9hLxdTZtEW
	1c+gwxuW5qbWVtLqyF0P6JJ/CFtgM9N4sjECuYX7t39BAox0IFxQjriusm9HjqPXz9o5VxxCOnJUX
	d5Nb/frz6oVSAq5g2R/hedK19YwNucgQDo7tSrx6qdf61TJ4vjO2mghra5p+zvm6U6zi7xW2frbve
	EPZxdCqf3oDay1EeyIjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPHn-0000000DpOx-0cGX;
	Tue, 23 Jul 2024 23:51:15 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWPHk-0000000DpO6-37c7
	for linux-i3c@lists.infradead.org;
	Tue, 23 Jul 2024 23:51:14 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B1EE0E0002;
	Tue, 23 Jul 2024 23:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1721778669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=X+SKAQmjNRPaji+Q2BhvyaBaM+HsQEPmFK6Rpkla9Fg=;
	b=DRflxrL8MpVMUI+uncAzrlRx98puYtmSGXghvzQCd/+DZgH/bsKS8yRFALNOCojPtD4oDo
	5/hF9fHZOKaiiEskupQZsBbn9Y8gFeu4adMmsrCzp4rhPDQbtKOmZTMu0FzV4oevLkXX29
	/tZZ6HD3oshkLBTCq5UFv1uXLxg8veoFQ7SiAzOWssmex1/YwER/Motfc2RfRSFMqn/0/s
	SISdwrIyk2gc8rTQVRgxqTxk1yVal2EVLdrhhMx5jmKS0uHoDL6K4VR8ahQeH5apsGdpV9
	Tz0ASG0b62bTdsfSoATrToj8E3iJlI6tsuBdbaJyaH4owYgAK7gp5jq9SbboIA==
Date: Wed, 24 Jul 2024 01:51:08 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: krzk@kernel.org, Frank Li <Frank.Li@nxp.com>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
	krzk+dt@kernel.org, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org, miquel.raynal@bootlin.com,
	robh@kernel.org
Subject: Re: [PATCH v2 1/1] dt-bindings: i3c: add header for generic I3C flags
Message-ID: <172177859264.478132.7118416055894101559.b4-ty@bootlin.com>
References: <20240715225351.3237284-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240715225351.3237284-1-Frank.Li@nxp.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_165112_958206_57E46505 
X-CRM114-Status: UNSURE (   5.73  )
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

On Mon, 15 Jul 2024 18:53:51 -0400, Frank Li wrote:
> Add header file for generic I3C flags to avoid hard code in dts file.
> 
> 

Applied, thanks!

[1/1] dt-bindings: i3c: add header for generic I3C flags
      https://git.kernel.org/abelloni/c/3564d9eb607d

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
