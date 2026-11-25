Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B93E3606A323
	for <linux-i3c@archiver.kernel.org>; Wed, 25 Nov 2026 10:51:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=na+jkMwY;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=C+ngV5w5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=ngnmP5WRAmjWtJk8UsG5MwS75iVmviqV5G56fZ/rRSo=; b=na+jkMwYPVd295J//IQWIxPa2e
	k38a9PJMJGHBzcGcUDX+jWZmu0lQJAGtOsU/QBtSzjn6IS+O3lQMpVsEkW4yMKgdemlDwIKCmx0zt
	qWDbjWhV3djIRAzGFApkb3tf8mnnyr22O/lhkR/hTI/f++ntR8BvCHIOLR6gVrfg1vqqA2nmTMCiQ
	09I9utw14oI1ITYTPainGZ6QNcfIT+Mr//qS01sv6dwHZrl7nzGNFjo7OGdKyPR1EpF4Jay2eKCFX
	qp0IuzC7Fbq9Qy8z71STeMw4j2xx0XYbVtmUi8FG1EBDmcr7CdLTdXxuc5pDQFjHNLKAFT5aAnwzz
	pdw+XCsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAb5-00000009VuG-22xj;
	Wed, 25 Nov 2026 10:51:31 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAb0-00000009VtP-3ml2
	for linux-i3c@lists.infradead.org;
	Wed, 25 Nov 2026 10:51:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=tDNqmNJxhF1H9S
	qZrRXbRJE/PLsy7GSLRGHoHg3IUiU=; b=C+ngV5w5sFKakSSFXbr6ATpWfAg8sP
	QJTnvnfSt+APKj+H7fZnkn5Nd7U3Nc7BXes+Mw0XWlL7T8PnPChRzoZ/fTX3LcfS
	eLq+I/xe8urDlQ8HW3BesYAbW4ylfqzcsL4ttEuIFMNHWoChw6TpYEKMrKCCIO6B
	/At3VAH2qK2+a4+4uKIyUpBmIirAtrn6pxIxDBqEvTcTmlAWIl2II19QHyVidBND
	Q7tobpoV7Rjgrvz4+q7pu/mhB8MAFkLjgvjNUxnpYFZ5SchVQ2l3+m8Sr8t1rL9k
	L9dsMgfacehiG/BgXAjNA0DUPNLeIpmFm94Ozs58QdTzy5mPDeFv/NHQ==
Received: (qmail 885822 invoked from network); 25 Nov 2026 11:51:24 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Nov 2026 11:51:24 +0100
X-UD-Smtp-Session: l3s3148p1@lRSpmxdhBsIujnvc
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i3c@lists.infradead.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [PATCH] MAINTAINERS: add renesas-soc list for the Renesas I3C driver
Date: Wed, 25 Nov 2026 11:49:53 +0100
Message-ID: <20261125105037.29830-3-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_025127_344218_54A180BF 
X-CRM114-Status: UNSURE (   7.54  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-i3c@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-i3c.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-i3c/>
List-Post: <mailto:linux-i3c@lists.infradead.org>
List-Help: <mailto:linux-i3c-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-i3c>,
 <mailto:linux-i3c-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-i3c" <linux-i3c-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

To make them show up in our patchwork instance.

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---

I missed a patch because of this missing entry. Should go via the I3C
tree, I assume.

 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ccbcdc0799b9..dd48e2268aba 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12707,6 +12707,7 @@ F:	drivers/i3c/master/i3c-master-cdns.c
 I3C DRIVER FOR RENESAS
 M:	Wolfram Sang <wsa+renesas@sang-engineering.com>
 M:	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
+L:	linux-renesas-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/i3c/renesas,i3c.yaml
 F:	drivers/i3c/master/renesas-i3c.c
-- 
2.53.0


-- 
linux-i3c mailing list
linux-i3c@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-i3c
