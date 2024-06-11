Return-Path: <linux-i3c-bounces+linux-i3c=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 338FCC27C75
	for <linux-i3c@archiver.kernel.org>; Tue, 11 Jun 2024 17:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=cHvpbs+NhIkuDbI7md9Vc1qNblU7bahKEAx4fPU+4n4=; b=yZU
	qZCF3wCYS5lR+x6/jwvEqQDu+C8Px5bpj2JHAp/40+XHtwrKSw+1THxr6iATMq/Gwk6OcijpGlRTv
	o5Nqm7JsgaeA6QX+UM4VPeSOP7fbgDmPj3vhTU7O92p19xLX90OHbnC6UsBfXPLzSGTyTC1INxs5u
	oGUFid9GQ+U3utlBqaTwNLgrCze18huxRrMybxfW/cSDtPac/lkRv1kD3DMVSzLlkN9H++qIRphAq
	bfk0NcvO8gyMobM4tn9ukh9XMXxaIg2BcG5dNi2OGFwhLW+ClPnjb9DkeHvVLFDl0a0GYSAzB5PkB
	bU8gQXUvF/v2fEcEIvJMUi9N78qnfWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH56q-00000009dUb-1CCW;
	Tue, 11 Jun 2024 17:16:36 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sH56n-00000009dTG-0GA5
	for linux-i3c@lists.infradead.org;
	Tue, 11 Jun 2024 17:16:34 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-627e4afa326so92566107b3.2
        for <linux-i3c@lists.infradead.org>; Tue, 11 Jun 2024 10:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1718126187; x=1718730987; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=hSJk4i6CiFyTA+xiXQFolq9PrmWtX/oAjt20PA2VXO4=;
        b=NuCEirb60uwekFrvXgAPu/Eo/8J5wxgJMvrgfoTeI/3h6BBGZaSakG8ZIqW8pFvsrb
         YjOXiw3iKAvLA274s/uaLgIeicy6ckgKRzNhk0BtIWAcR2YvoNT1CfYaZw7pvMZh9sx3
         fkrgXYfJPu5NziST5kp9gepp5xHlANbdJ7xFovLrtKfJ764nOxyFIgOqqlEc6bmm4PHR
         6AmK4FoB67n0jSEE83gifShBi/4zaEGKfCf6/hhDxt2P54DTmUDeIr5TrxIJuPgMQv1S
         rgNwv0batK15VhADQGzQsi0pSkmNcdVpWkh6QnhTNih/Ul2AdyWStIQ2FiS5NY4Qtn2u
         EghQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718126187; x=1718730987;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hSJk4i6CiFyTA+xiXQFolq9PrmWtX/oAjt20PA2VXO4=;
        b=dPgZXBjjj4V2q9MTIg4YpXAhdIKD2jgcLoRKJJ9CBzDUmTA3CMYgTvlqVyhZs02YUb
         YilW0+wvXMiJDYVGpkZW7KMLdR5IiVVIEcBzp8+gGsCkfxVglnA5m8fAabzfvvZeH3Us
         Txgw3tBUY3VNt6V9RBSzYc2nH0V1H6d3HEdNgP35OZh+poEzvJ8t3CkPMgUM15xQ8CP/
         y+UymwyaOnHvYhPktLjl5lpdJyEqfGZ8DfucTBms/E1WigxzYZS1mxcHo+13K2hwH0Fy
         e0PpkEdI2lp7VGgtuCMfH0HLZwyMnjeBgLBpHjMsCm9zHf6P4LA323GN7HXJ/1cZJMRE
         KSuQ==
X-Gm-Message-State: AOJu0YxIOCPmt5KNQ9g892BIaUQjIuauMpaIkb+E5uLrxNxYH0rSCuMx
	6Nq2YJMG+4FPHWjGxn4XHggYqYwkuy7d2kxZiXAlk4HjyfK98DjpciPK3tygpAy0j4zWwiyXhn0
	aVzgrzX/CbPKsgdHcZDhhnLkd5w==
X-Google-Smtp-Source: AGHT+IEY+40hETMkg0kKm8Yl23Q7Oxp2FMPvAjMasenOB2rn5gy1l4SMxnz3rEEaTtldeQnZVDv6905q+FxpRkCKOos=
X-Received: from aniketm.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:3387])
 (user=aniketmaurya job=sendgmr) by 2002:a81:4cd5:0:b0:62c:de24:c501 with SMTP
 id 00721157ae682-62cde24c97fmr19335417b3.8.1718126187008; Tue, 11 Jun 2024
 10:16:27 -0700 (PDT)
Date: Tue, 11 Jun 2024 17:15:58 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.505.gda0bf45e8d-goog
Message-ID: <20240611171600.1105124-1-aniketmaurya@google.com>
Subject: [PATCH 0/2] i3c: dw: Add APB clk
From: Aniket <aniketmaurya@google.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Jeremy Kerr <jk@codeconstruct.com.au>, 
	Joel Stanley <joel@jms.id.au>, Billy Tsai <billy_tsai@aspeedtech.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-i3c@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, Aniket <aniketmaurya@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240611_101633_117911_B1B23BC8 
X-CRM114-Status: UNSURE (   6.60  )
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

The patches add APB clk aka pclk to the
dw i3c driver and the binding doc.

Aniket (2):
  dt-bindings: i3c: dw: Add clock binding
  i3c: dw: Add optional apb clock

 .../bindings/i3c/snps,dw-i3c-master.yaml      | 19 ++++++++++++++++++-
 drivers/i3c/master/dw-i3c-master.c            | 12 ++++++++++++
 drivers/i3c/master/dw-i3c-master.h            |  1 +
 3 files changed, 31 insertions(+), 1 deletion(-)

-- 
2.45.2.505.gda0bf45e8d-goog


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
