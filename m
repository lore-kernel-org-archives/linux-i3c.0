Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 910B3C04A94
	for <linux-i3c@archiver.kernel.org>; Thu, 10 Aug 2023 07:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hQq1Z3XJ0NlbCVAwJN4S38qlS/GkQUzS2/ctw3XRLPg=; b=yfmwWEIpawvOE7
	jJ5JVbjWaJvgQn/LWtKd2j0FVxuxwQQEU0i65lg5Gxm+0svpXZ04/SrTbCQSWofubr0uV10Z0rnrw
	x+pglL2K8TkeIgovbosU5MvOSKu/MfseUtuSPf+S29teXINYN4XPcCbhz5FhC7brWp8s6Fb3pdTag
	JbiGZLGO5FepdtCRShXsKjduqiWsgU7+h5u335DkNYie0oEqL96N7s2E2mFjcKd2B/n78l5ru7hgB
	IdMXruWg2F/NYDFIHVzxVWnfTYOJi87opFuK8vqgai3BFjGCthypTLoPUD9zMLdxRXarF4BXr0dSh
	UkpKCComJ4i2v9E8RQvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0FE-006lPx-2w;
	Thu, 10 Aug 2023 07:38:08 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0FB-006lPO-2p
	for linux-i3c@lists.infradead.org;
	Thu, 10 Aug 2023 07:38:07 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E591C0002;
	Thu, 10 Aug 2023 07:38:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1691653083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Lq3q3lkKBxWurRNhXxTmv9g9e19s6OWIb+pFHyepukk=;
	b=jyDUOHZ3ynN6/1Y6r3YrlTUAVU6AaH7j9Weom92K0Ghi5wuOtDHufy7Rofr46pNoebTr/u
	Q5nmELPwMOJSBAnzDMh9KGGw3H2sbnfFSHYGQZLlvTsjH5DBpiwxaK+k5i4E8Yb5CohqeV
	Qjbt5pS4PjFNDN6TY3qtOqHcZAYDfUiiWSw1lhsw7p2AI8s/t6I8eQXh+it2ZnuM51ILGs
	Sxr3cm/Dk/Ssyf61m+hNGw1o6yBxw6sYJLpxN4kVN9X7z8mfD2dqoNBDlhfh4G0Oejru4F
	ekaBYu9jcBcBGoDklt2XrJOamG9GGyOCyn+KWxWVb8XEnsGVIw7W7bpLmAJfJg==
Date: Thu, 10 Aug 2023 09:38:03 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH] i3c/master: cmd_v1: Fix the exit criteria for the daa
 procedure
Message-ID: <169165306480.966832.11791541519030436327.b4-ty@bootlin.com>
References: <20230802100909.2568215-1-billy_tsai@aspeedtech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802100909.2568215-1-billy_tsai@aspeedtech.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_003806_068483_0FF4F476 
X-CRM114-Status: UNSURE (   7.10  )
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


On Wed, 02 Aug 2023 18:09:09 +0800, Billy Tsai wrote:
> The exit criteria for the DAA should check if the data length is equal to
> 1, instead of checking if the response status is equal to 1.
> 
> 

Applied, thanks!

[1/1] i3c/master: cmd_v1: Fix the exit criteria for the daa procedure
      commit: cbf871e6d8ce23dd4d458d8b7ab9d4a267e7bc03

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
