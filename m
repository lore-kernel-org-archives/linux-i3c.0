Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AE76103E2E6
	for <linux-i3c@archiver.kernel.org>; Wed, 11 Mar 2026 22:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0musZMdW41SbvAecbILlNVX2x0nEpK9VxGTk/I60SWQ=; b=I+NrtsWFHNen7e
	Aj+wt1uR+I1m1+6v1h5Vvl89BbUNPEV3yI2cBDMxBIYEXxhl/KmsCIRxrWN87t1WFxRrhVrDY5N3X
	p1qKFQk8HfigyOn1cA2k57Skh9HGuuwCGEJS+QWO0Uumxnt8lVbnRtmX3lbhmEGXWUzjfBXyqi1RK
	pabSJkTRPsK3N05yUUktuxejapAzW9AJ1IrzBVX8LST+gLFtL9/iXx+mbJsD7TmQC4swpe5noxepu
	N9q3j/u+7ZS3OSSI2+VHYzOeuOHvkACDj/FLPxsrNhkFtrcpsg3vCVHIu6bjboMBq0RiNG1i+fkL6
	MdFtpDY8PsnpTDpWFPmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rh7-0000000Ccae-4A1K;
	Wed, 11 Mar 2026 22:06:21 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0Rh5-0000000CcZI-05bI
	for linux-i3c@lists.infradead.org;
	Wed, 11 Mar 2026 22:06:20 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id EABB81A2DCD;
	Wed, 11 Mar 2026 22:06:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB94460004;
	Wed, 11 Mar 2026 22:06:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A0B510369BAF;
	Wed, 11 Mar 2026 23:06:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1773266775; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=8I/cBM2paZR5qxCHtc+Yf5SzrN3xCWu16o5R1WNwpBY=;
	b=TKH/wyx89U42BCdv3OBj9m1984RIfhyFEZyTnpKB865t/x0waHjxfbWXsVRyDKCE1ovizp
	S2pKYlU82zJ2J0K+R3LjrOLe17W3B2HMWN8aN5iPCN0oDp9p+Wz2wuGW0SQYyH8GYY8gvm
	G95Zx62cpFGSXodgVLmQOkMyXgzpOZKyO8iZopYI50ntLxbxbT7yoRX4nfpNH7UkUJu8Wu
	UDr9Z2RfhlnlP7chbP5p4fJ4KETtMxGGvXlBRDEkcSKi5mjKVgq7iGvy5cGuSdTD3YYngI
	8m8U6VcsRuYjNYOKpvFwmuZGiCpMg7ToDwk6MAPw2sGMLP+A7fx6fwu718Ozzg==
Date: Wed, 11 Mar 2026 23:06:14 +0100
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Frank Li <Frank.Li@nxp.com>,
	linux-i3c@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH] i3c: master: svc: spelling corrections
Message-ID: <177326636988.2391121.8519981227347109446.b4-ty@bootlin.com>
References: <20260216061755.2801697-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260216061755.2801697-1-rdunlap@infradead.org>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_150619_214850_1B40F2F4 
X-CRM114-Status: UNSURE (   5.08  )
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

On Sun, 15 Feb 2026 22:17:55 -0800, Randy Dunlap wrote:
> Correct spelling for 3 words as identified by codespell:
> 
> svc-i3c-master.c:340: tigger ==> trigger
> svc-i3c-master.c:532: reamins ==> remains
> svc-i3c-master.c:734: filetered ==> filtered
> 
> 
> [...]

Applied, thanks!

[1/1] i3c: master: svc: spelling corrections
      https://git.kernel.org/i3c/c/5912baff068a

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
