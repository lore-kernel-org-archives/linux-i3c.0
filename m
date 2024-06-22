Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42499C27C78
	for <linux-i3c@archiver.kernel.org>; Sat, 22 Jun 2024 22:34:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DRld4EgbnQ6H1xh81V4CFRUp/UWN1pIsYtqDw7V2ISg=; b=LyxrQoiYkOu13r
	WtvatBm/6Oix5IxjVJNFEK09xGQAKgpb95oWKgqSCz77MHtZVSskSPSwmUTu9J0x3D+A0WYIt4wY9
	nWEGyys/bE2Bl1tF7GK6xXduaNx5bNya1FLvBazLz23jw6ObjA4N+vYtXzBtlb9ekN8BOccmU4Pin
	EdfGQO2FmcRlDR2qB8q1XX0fmLARu2xX78PQsIOUrzuOM8iKRE4pTHxod9dGnbda0zi4z8HTL7n/W
	9ow/CxqKp18Q2klfw5chH5/08AL4e9/3GH3OWfFsDTtNtN2MzubTQO2zlf03b4TIYnvB5e55S5WzQ
	NLmYXr3Hl3ku43oJbFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9JS-0000000CvrG-44El;
	Sat, 22 Jun 2024 22:34:26 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sL9JP-0000000Cvqf-2lgv
	for linux-i3c@lists.infradead.org;
	Sat, 22 Jun 2024 22:34:25 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id B2B64E0002;
	Sat, 22 Jun 2024 22:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1719095660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LIGShAqySxw3ATO7IfMdaO85UyQ5vDAdZfgC2/hd13I=;
	b=UCLhw/nKLkCE005HQ5EKu3Uf6hskMft++8KNqmGUVJwQQsr9B4MDJBappr4ZFq5bTG2gx5
	FW3637ur85CcSKIX72x8btPRhUEG6vBBpkWkTXJKEYsn54CcdsFS8cJ+VYIy3p8EWXx1EW
	TTKttdSBeQuliHLnCVmm+Wm5O9w2FZMNjRUziSeJ/501A1e807WB1ZaDgFDtswp4Wl5lkq
	lAUGfYmCxJPnQSKnKYgNfRNmkzSJDbHpe2wI44MwUn76+yFQuu/x/q2Zdq1XnX1JmpLP3f
	aRMQPV1Xu3GMWxsZAjMiml+FzfNrqSJaqvDVrHxChLBbpHLgizQz3pFCtnhbrw==
Date: Sun, 23 Jun 2024 00:34:20 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: linux-i3c@lists.infradead.org,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: stable@vger.kernel.org
Subject: Re: [PATCH v2] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for
 HCI versions < 1.1
Message-ID: <171909557751.2164405.4665114035482836727.b4-ty@bootlin.com>
References: <20240617113251.1159534-1-jarkko.nikula@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240617113251.1159534-1-jarkko.nikula@linux.intel.com>
X-GND-Sasl: alexandre.belloni@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240622_153423_860450_143E1AD6 
X-CRM114-Status: UNSURE (   7.51  )
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

On Mon, 17 Jun 2024 14:32:51 +0300, Jarkko Nikula wrote:
> I was wrong about the TABLE_SIZE field description in the
> commit 0676bfebf576 ("i3c: mipi-i3c-hci: Fix DAT/DCT entry sizes").
> 
> For the MIPI I3C HCI versions 1.0 and earlier the TABLE_SIZE field in
> the registers DAT_SECTION_OFFSET and DCT_SECTION_OFFSET is indeed defined
> in DWORDs and not number of entries like it is defined in later versions.
> 
> [...]

Applied, thanks!

[1/1] i3c: mipi-i3c-hci: Fix number of DAT/DCT entries for HCI versions < 1.1
      https://git.kernel.org/abelloni/c/17bebfeab08b

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
