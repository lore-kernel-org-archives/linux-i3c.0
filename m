Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CC4D37E3D
	for <linux-i3c@archiver.kernel.org>; Wed, 14 Jan 2026 15:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRzsjDVhJXwjdrwbYbPod6C5GBDeu5z9we/NZ2LbpqE=; b=lmi9LBC1GWwNJl
	Sod8Y4VE+gjr22Q0Y41WP6FaHJqoyETMu48J7d4DewOFjN8UzFMiFw3ItocAO5S/sjtYPZ7xlMY9s
	QiPT8cm/Jg2GCNQnscSrb8vI1dbDZ4U+zF+W/j8W49RrgT3J15AAo2Rfi/jHTQbSaPIT9iFdCJfoG
	ulkByWgEy8VO0jFK2bfG6aeICbnpvArwwcgzvSu1pZ3aKxMA2V7n+oS0JM/6H2sKxSsnWJgQwawhP
	XWVKCVOFfXVTk2NIMILuWM8nHmNHzNoyO0Gb9hvls+edhM0YphdLN5PgHqWL0WYYu3SMrkq+awXQX
	a6BYy01bTNvB+g6HcGPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2OY-00000009bz8-2wiE;
	Wed, 14 Jan 2026 15:02:50 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg2OV-00000009bxw-37NI
	for linux-i3c@lists.infradead.org;
	Wed, 14 Jan 2026 15:02:49 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 67F41C1F1C4
	for <linux-i3c@lists.infradead.org>; Wed, 14 Jan 2026 15:02:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 11BCF6074A;
	Wed, 14 Jan 2026 15:02:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB6F710B68265;
	Wed, 14 Jan 2026 16:02:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768402965;
	h=from:subject:date:message-id:to:mime-version:content-type:in-reply-to:
	 references; bh=qFyx8Tr66UbAD4luxKwJ9dCj9AEsKHX6Ffh3J2DUUvk=;
	b=ZqJ4cmrd7SZBIfM9tvSY5JWs5X/qktnG++jjd4L528qNhnPOJp8rFOiC1NWx/U0UrlyG6b
	Fe4fIppcaHfacEIA0Dy0tiAY6piBsjapmlMWA6nCap33IrL8w5Khb52woynahB8K5Oxbaq
	CmtGjaApjHo+ep0DbC9B/C+6Ox0XzZtNGKhjaqeIAebWrZOxQvbRubacAfg+IoLTxkkWCN
	bqrw3FYtpl1AK1dExUwxUHHSmaXX5w5wXqmD4lu4jYXnWmjcJAw6zkAYRud3iwQxcA+FBc
	tBBps1DXS5CM4Hi/EJyiXIer0p5jAY1IV0i9f0u8sjpaYIOMrPxWzX6WsPt+gg==
Date: Wed, 14 Jan 2026 16:02:44 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Frank Li <Frank.Li@nxp.com>, linux-i3c@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] i3c: master: Simplify with scoped for each OF child loop
Message-ID: <176840281752.1259180.12576987425624084003.b4-ty@bootlin.com>
References: <20251224124551.208778-2-krzysztof.kozlowski@oss.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251224124551.208778-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_070247_921235_4EF9E92F 
X-CRM114-Status: UNSURE (   5.46  )
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

On Wed, 24 Dec 2025 13:45:52 +0100, Krzysztof Kozlowski wrote:
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
> 
> 

Applied, thanks!

[1/1] i3c: master: Simplify with scoped for each OF child loop
      https://git.kernel.org/i3c/c/ceff3bc1518a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
