Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C8C6E95A8F
	for <linux-i3c@archiver.kernel.org>; Tue, 10 Oct 2023 10:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aJvnd0ZTLaOrnG7xIqGphPNSV3RRm+MCSSylk+vXLKk=; b=dZm6RQJCiayhpL
	T9J77oe/qxRDJfjS0MpwmhdUfIpu4Q46SAQo2g6L0DyNJcxctAeMtVBGgtpDKqG09vSM5bltSVP2y
	O2OnytSuTPy8CTmqHlZHtqbfnM5A4GolJB298HFAfoBANB1C9OprGBEwsXAhhIBrPkjW/UwNPKge/
	p3iubXRho/SWzDAfA52dmw4aReai8T2S9PGNb10GwI0Q4BrAqctn73PPEo3ZNrzH5n1u1WHflldNT
	KACGloYbF2kGpu9RKUlkaKvZMcqRrBV/HQJS+aZ7hvsD0WMXZLRVi0EDLGFykOyZtzT+H6mgU2UT7
	NvjtPSo2hnaL6XJUOX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9jm-00D08C-2E;
	Tue, 10 Oct 2023 10:13:14 +0000
Received: from relay1-d.mail.gandi.net ([2001:4b98:dc4:8::221])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qq9ji-00D07M-1Y
	for linux-i3c@lists.infradead.org;
	Tue, 10 Oct 2023 10:13:12 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3B782240010;
	Tue, 10 Oct 2023 10:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1696932783;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=tUJNRfjUuKDFIex/FlVkBB3IJFXVfYCMFME1OSx+B1Q=;
	b=ooMZcpQQ9d+EZTwSj4Ex/lkRdL5BVBOV/mrBbIZ3BpTjcbG6JWrDXoTX18T/WTyoRkLVWK
	Ui1KsmIrLO0e58CyJfmXa1EPjj6hT1+xZ0foZI7Qe+g6ndpyxdT78rigRFF8y/kn5ReIgX
	Uk8h14kB6mb6I/S3AHgnZPmYDXQqPILahEhNbmgO8EWdATehaN677V+prOn2LWFo5I8pFP
	2ZejcQt6wNfXe8xsDVAcfpZZqhAYWtHGOs48NzT/LnnLG5XjV/eLuArgVrXHfu+RjOeZxR
	YKcgTv73SEJb5GYitNWi7/22TLOzchudYSSFdsiP05XNA62nEyQXHf4aZD8Mlg==
Date: Tue, 10 Oct 2023 12:13:01 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Matt Johnston <matt@codeconstruct.com.au>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Conor Culhane <conor.culhane@silvaco.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH] i3c: Fix typo "Provisional ID" to "Provisioned ID"
Message-ID: <169693275141.1756460.10774272832837669579.b4-ty@bootlin.com>
References: <20231003075339.197099-1-matt@codeconstruct.com.au>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231003075339.197099-1-matt@codeconstruct.com.au>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231010_031310_687008_52D76567 
X-CRM114-Status: UNSURE (   7.24  )
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


On Tue, 03 Oct 2023 15:53:39 +0800, Matt Johnston wrote:
> The MIPI I3C spec refers to a Provisioned ID, since it is (sometimes)
> provisioned at device manufacturing.
> 
> 

Applied, thanks!

[1/1] i3c: Fix typo "Provisional ID" to "Provisioned ID"
      commit: 57ec42b9a1b7e4db4a1c2aa4fcc4eefe6d31bcb8

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
